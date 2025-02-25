; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32"

@llvm.used = appending global [1 x i8*] [i8* bitcast (i32 ()* @__main_void to i8*)], section "llvm.metadata"

@__main_void = alias i32 (), i32 ()* @main

; Function Attrs: norecurse nounwind readnone
define hidden i32 @main() #0 {
  ret i32 0
}

; Function Attrs: nounwind
define hidden void @lstr(i8* nocapture readonly %0) local_unnamed_addr #1 {
  %2 = tail call i32 @strlen(i8* nonnull dereferenceable(1) %0)
  %3 = tail call i32 @lognc() #7
  %4 = icmp eq i32 %2, 0
  br i1 %4, label %11, label %5

5:                                                ; preds = %5, %1
  %6 = phi i32 [ %9, %5 ], [ 0, %1 ]
  %7 = getelementptr i8, i8* %0, i32 %6
  %8 = load i8, i8* %7, align 1, !tbaa !3
  tail call void @logfc(i32 %3, i8 signext %8) #7
  %9 = add nuw i32 %6, 1
  %10 = icmp eq i32 %9, %2
  br i1 %10, label %11, label %5

11:                                               ; preds = %5, %1
  tail call void @logpc(i32 %3) #7
  ret void
}

declare i32 @lognc() local_unnamed_addr #2

declare void @logfc(i32, i8 signext) local_unnamed_addr #2

declare void @logpc(i32) local_unnamed_addr #2

; Function Attrs: nofree norecurse nounwind
define hidden void @bcopy(i8* readonly %0, i8* %1, i32 %2) local_unnamed_addr #3 {
  %4 = icmp ult i8* %1, %0
  br i1 %4, label %5, label %16

5:                                                ; preds = %3
  %6 = icmp eq i32 %2, 0
  br i1 %6, label %31, label %7

7:                                                ; preds = %7, %5
  %8 = phi i8* [ %14, %7 ], [ %1, %5 ]
  %9 = phi i8* [ %12, %7 ], [ %0, %5 ]
  %10 = phi i32 [ %11, %7 ], [ %2, %5 ]
  %11 = add i32 %10, -1
  %12 = getelementptr i8, i8* %9, i32 1
  %13 = load i8, i8* %9, align 1, !tbaa !3
  %14 = getelementptr i8, i8* %8, i32 1
  store i8 %13, i8* %8, align 1, !tbaa !3
  %15 = icmp eq i32 %11, 0
  br i1 %15, label %31, label %7

16:                                               ; preds = %3
  %17 = add i32 %2, -1
  %18 = icmp eq i32 %2, 0
  br i1 %18, label %31, label %19

19:                                               ; preds = %16
  %20 = getelementptr i8, i8* %1, i32 %17
  %21 = getelementptr i8, i8* %0, i32 %17
  br label %22

22:                                               ; preds = %22, %19
  %23 = phi i8* [ %29, %22 ], [ %20, %19 ]
  %24 = phi i8* [ %27, %22 ], [ %21, %19 ]
  %25 = phi i32 [ %26, %22 ], [ %2, %19 ]
  %26 = add i32 %25, -1
  %27 = getelementptr i8, i8* %24, i32 -1
  %28 = load i8, i8* %24, align 1, !tbaa !3
  %29 = getelementptr i8, i8* %23, i32 -1
  store i8 %28, i8* %23, align 1, !tbaa !3
  %30 = icmp eq i32 %26, 0
  br i1 %30, label %31, label %22

31:                                               ; preds = %22, %16, %7, %5
  ret void
}

; Function Attrs: norecurse nounwind readonly
define hidden i8* @memchr(i8* readonly %0, i32 %1, i32 %2) local_unnamed_addr #4 {
  %4 = icmp eq i32 %2, 0
  br i1 %4, label %15, label %5

5:                                                ; preds = %12, %3
  %6 = phi i32 [ %8, %12 ], [ %2, %3 ]
  %7 = phi i8* [ %13, %12 ], [ %0, %3 ]
  %8 = add i32 %6, -1
  %9 = load i8, i8* %7, align 1, !tbaa !3
  %10 = zext i8 %9 to i32
  %11 = icmp eq i32 %10, %1
  br i1 %11, label %15, label %12

12:                                               ; preds = %5
  %13 = getelementptr i8, i8* %7, i32 1
  %14 = icmp eq i32 %8, 0
  br i1 %14, label %15, label %5

15:                                               ; preds = %12, %5, %3
  %16 = phi i8* [ null, %3 ], [ null, %12 ], [ %7, %5 ]
  ret i8* %16
}

; Function Attrs: norecurse nounwind readonly
define hidden i32 @memcmp(i8* nocapture readonly %0, i8* nocapture readonly %1, i32 %2) local_unnamed_addr #4 {
  br label %4

4:                                                ; preds = %9, %3
  %5 = phi i32 [ %2, %3 ], [ %10, %9 ]
  %6 = phi i8* [ %0, %3 ], [ %11, %9 ]
  %7 = phi i8* [ %1, %3 ], [ %13, %9 ]
  %8 = icmp eq i32 %5, 0
  br i1 %8, label %19, label %9

9:                                                ; preds = %4
  %10 = add i32 %5, -1
  %11 = getelementptr i8, i8* %6, i32 1
  %12 = load i8, i8* %6, align 1, !tbaa !3
  %13 = getelementptr i8, i8* %7, i32 1
  %14 = load i8, i8* %7, align 1, !tbaa !3
  %15 = icmp eq i8 %12, %14
  br i1 %15, label %4, label %16

16:                                               ; preds = %9
  %17 = icmp ult i8 %12, %14
  %18 = select i1 %17, i32 -1, i32 1
  br label %19

19:                                               ; preds = %16, %4
  %20 = phi i32 [ %18, %16 ], [ 0, %4 ]
  ret i32 %20
}

; Function Attrs: nounwind
define hidden i8* @memcpy(i8* returned %0, i8* nocapture readonly %1, i32 %2) local_unnamed_addr #1 {
  tail call void @llvm.memmove.p0i8.p0i8.i32(i8* align 1 %0, i8* align 1 %1, i32 %2, i1 false)
  ret i8* %0
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i32(i8* nocapture, i8* nocapture readonly, i32, i1 immarg) #5

; Function Attrs: norecurse nounwind readonly
define hidden i8* @memmem(i8* readonly %0, i32 %1, i8* nocapture readonly %2, i32 %3) local_unnamed_addr #4 {
  %5 = getelementptr i8, i8* %0, i32 %1
  %6 = sub i32 0, %3
  %7 = getelementptr i8, i8* %5, i32 %6
  %8 = icmp eq i32 %3, 0
  br i1 %8, label %34, label %9

9:                                                ; preds = %4
  %10 = icmp ult i32 %1, %3
  %11 = icmp ult i8* %7, %0
  %12 = or i1 %10, %11
  br i1 %12, label %34, label %13

13:                                               ; preds = %9
  %14 = load i8, i8* %2, align 1, !tbaa !3
  br label %15

15:                                               ; preds = %31, %13
  %16 = phi i8* [ %0, %13 ], [ %32, %31 ]
  %17 = load i8, i8* %16, align 1, !tbaa !3
  %18 = icmp eq i8 %17, %14
  br i1 %18, label %19, label %31

19:                                               ; preds = %27, %15
  %20 = phi i32 [ %25, %27 ], [ %3, %15 ]
  %21 = phi i8* [ %24, %27 ], [ %16, %15 ]
  %22 = phi i8* [ %23, %27 ], [ %2, %15 ]
  %23 = getelementptr i8, i8* %22, i32 1
  %24 = getelementptr i8, i8* %21, i32 1
  %25 = add i32 %20, -1
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %34, label %27

27:                                               ; preds = %19
  %28 = load i8, i8* %24, align 1, !tbaa !3
  %29 = load i8, i8* %23, align 1, !tbaa !3
  %30 = icmp eq i8 %28, %29
  br i1 %30, label %19, label %31

31:                                               ; preds = %27, %15
  %32 = getelementptr i8, i8* %16, i32 1
  %33 = icmp ugt i8* %32, %7
  br i1 %33, label %34, label %15

34:                                               ; preds = %31, %19, %9, %4
  %35 = phi i8* [ %0, %4 ], [ null, %9 ], [ %16, %19 ], [ null, %31 ]
  ret i8* %35
}

; Function Attrs: nounwind
define hidden i8* @memmove(i8* returned %0, i8* nocapture readonly %1, i32 %2) local_unnamed_addr #1 {
  tail call void @llvm.memmove.p0i8.p0i8.i32(i8* align 1 %0, i8* align 1 %1, i32 %2, i1 false)
  ret i8* %0
}

; Function Attrs: nounwind
define hidden i8* @mempcpy(i8* %0, i8* nocapture readonly %1, i32 %2) local_unnamed_addr #1 {
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 1 %0, i8* align 1 %1, i32 %2, i1 false)
  %4 = getelementptr i8, i8* %0, i32 %2
  ret i8* %4
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i32, i1 immarg) #5

; Function Attrs: nofree norecurse nounwind writeonly
define hidden i8* @memset(i8* returned %0, i32 %1, i32 %2) local_unnamed_addr #6 {
  %4 = icmp eq i32 %2, 0
  br i1 %4, label %13, label %5

5:                                                ; preds = %3
  %6 = trunc i32 %1 to i8
  br label %7

7:                                                ; preds = %7, %5
  %8 = phi i8* [ %0, %5 ], [ %11, %7 ]
  %9 = phi i32 [ %2, %5 ], [ %10, %7 ]
  %10 = add i32 %9, -1
  %11 = getelementptr i8, i8* %8, i32 1
  store i8 %6, i8* %8, align 1, !tbaa !3
  %12 = icmp eq i32 %10, 0
  br i1 %12, label %13, label %7

13:                                               ; preds = %7, %3
  ret i8* %0
}

; Function Attrs: norecurse nounwind readonly
define hidden i32 @strlen(i8* %0) local_unnamed_addr #4 {
  %2 = ptrtoint i8* %0 to i32
  %3 = and i32 %2, 3
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %22, label %5

5:                                                ; preds = %1
  %6 = load i8, i8* %0, align 1, !tbaa !3
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %13, label %16

8:                                                ; preds = %16
  %9 = load i8, i8* %18, align 1, !tbaa !3
  %10 = icmp eq i8 %9, 0
  br i1 %10, label %11, label %16

11:                                               ; preds = %8
  %12 = ptrtoint i8* %18 to i32
  br label %13

13:                                               ; preds = %11, %5
  %14 = phi i32 [ %2, %5 ], [ %12, %11 ]
  %15 = sub i32 %14, %2
  br label %66

16:                                               ; preds = %8, %5
  %17 = phi i8* [ %18, %8 ], [ %0, %5 ]
  %18 = getelementptr i8, i8* %17, i32 1
  %19 = ptrtoint i8* %18 to i32
  %20 = and i32 %19, 3
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %8

22:                                               ; preds = %16, %1
  %23 = phi i8* [ %0, %1 ], [ %18, %16 ]
  %24 = bitcast i8* %23 to i32*
  br label %25

25:                                               ; preds = %61, %22
  %26 = phi i32* [ %24, %22 ], [ %27, %61 ]
  %27 = getelementptr i32, i32* %26, i32 1
  %28 = load i32, i32* %26, align 4, !tbaa !6
  %29 = add i32 %28, -16843009
  %30 = and i32 %28, -2139062144
  %31 = xor i32 %30, -2139062144
  %32 = and i32 %31, %29
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %61, label %34

34:                                               ; preds = %25
  %35 = trunc i32 %28 to i8
  %36 = bitcast i32* %26 to i8*
  %37 = icmp eq i8 %35, 0
  br i1 %37, label %38, label %41

38:                                               ; preds = %34
  %39 = ptrtoint i32* %26 to i32
  %40 = sub i32 %39, %2
  br label %66

41:                                               ; preds = %34
  %42 = getelementptr i8, i8* %36, i32 1
  %43 = load i8, i8* %42, align 1, !tbaa !3
  %44 = icmp eq i8 %43, 0
  br i1 %44, label %45, label %49

45:                                               ; preds = %41
  %46 = ptrtoint i32* %26 to i32
  %47 = sub i32 1, %2
  %48 = add i32 %47, %46
  br label %66

49:                                               ; preds = %41
  %50 = getelementptr i8, i8* %36, i32 2
  %51 = load i8, i8* %50, align 1, !tbaa !3
  %52 = icmp eq i8 %51, 0
  br i1 %52, label %53, label %57

53:                                               ; preds = %49
  %54 = ptrtoint i32* %26 to i32
  %55 = sub i32 2, %2
  %56 = add i32 %55, %54
  br label %66

57:                                               ; preds = %49
  %58 = getelementptr i8, i8* %36, i32 3
  %59 = load i8, i8* %58, align 1, !tbaa !3
  %60 = icmp eq i8 %59, 0
  br i1 %60, label %62, label %61

61:                                               ; preds = %57, %25
  br label %25

62:                                               ; preds = %57
  %63 = ptrtoint i32* %26 to i32
  %64 = sub i32 3, %2
  %65 = add i32 %64, %63
  br label %66

66:                                               ; preds = %62, %53, %45, %38, %13
  %67 = phi i32 [ %15, %13 ], [ %40, %38 ], [ %48, %45 ], [ %56, %53 ], [ %65, %62 ]
  ret i32 %67
}

attributes #0 = { norecurse nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+exception-handling,+reference-types" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+exception-handling,+reference-types" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+exception-handling,+reference-types" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nofree norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+exception-handling,+reference-types" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { norecurse nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+exception-handling,+reference-types" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind willreturn }
attributes #6 = { nofree norecurse nounwind writeonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+exception-handling,+reference-types" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind }

!llvm.ident = !{!0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2}

!0 = !{!"clang version 11.1.0"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"long", !4, i64 0}
