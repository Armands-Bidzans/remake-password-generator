; ModuleID = './src/memory.c'
source_filename = "./src/memory.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32"

; Function Attrs: nofree norecurse nounwind
define hidden void @bcopy(i8* readonly %0, i8* %1, i32 %2) local_unnamed_addr #0 {
  %4 = icmp ult i8* %1, %0
  br i1 %4, label %5, label %16

5:                                                ; preds = %3
  %6 = icmp eq i32 %2, 0
  br i1 %6, label %31, label %7

7:                                                ; preds = %5, %7
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

22:                                               ; preds = %19, %22
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

31:                                               ; preds = %22, %7, %16, %5
  ret void
}

; Function Attrs: norecurse nounwind readonly
define hidden i8* @memchr(i8* readonly %0, i32 %1, i32 %2) local_unnamed_addr #1 {
  %4 = icmp eq i32 %2, 0
  br i1 %4, label %15, label %5

5:                                                ; preds = %3, %12
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

15:                                               ; preds = %5, %12, %3
  %16 = phi i8* [ null, %3 ], [ null, %12 ], [ %7, %5 ]
  ret i8* %16
}

; Function Attrs: norecurse nounwind readonly
define hidden i32 @memcmp(i8* nocapture readonly %0, i8* nocapture readonly %1, i32 %2) local_unnamed_addr #1 {
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

19:                                               ; preds = %4, %16
  %20 = phi i32 [ %18, %16 ], [ 0, %4 ]
  ret i32 %20
}

; Function Attrs: nounwind
define hidden i8* @memcpy(i8* returned %0, i8* nocapture readonly %1, i32 %2) local_unnamed_addr #2 {
  tail call void @llvm.memmove.p0i8.p0i8.i32(i8* align 1 %0, i8* align 1 %1, i32 %2, i1 false)
  ret i8* %0
}

; Function Attrs: norecurse nounwind readonly
define hidden i8* @memmem(i8* readonly %0, i32 %1, i8* nocapture readonly %2, i32 %3) local_unnamed_addr #1 {
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

15:                                               ; preds = %13, %31
  %16 = phi i8* [ %0, %13 ], [ %32, %31 ]
  %17 = load i8, i8* %16, align 1, !tbaa !3
  %18 = icmp eq i8 %17, %14
  br i1 %18, label %19, label %31

19:                                               ; preds = %15, %27
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
define hidden i8* @memmove(i8* returned %0, i8* nocapture readonly %1, i32 %2) local_unnamed_addr #2 {
  tail call void @llvm.memmove.p0i8.p0i8.i32(i8* align 1 %0, i8* align 1 %1, i32 %2, i1 false)
  ret i8* %0
}

; Function Attrs: nounwind
define hidden i8* @mempcpy(i8* %0, i8* nocapture readonly %1, i32 %2) local_unnamed_addr #2 {
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 1 %0, i8* align 1 %1, i32 %2, i1 false)
  %4 = getelementptr i8, i8* %0, i32 %2
  ret i8* %4
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i32, i1 immarg) #3

; Function Attrs: nofree norecurse nounwind writeonly
define hidden i8* @memset(i8* returned %0, i32 %1, i32 %2) local_unnamed_addr #4 {
  %4 = icmp eq i32 %2, 0
  br i1 %4, label %13, label %5

5:                                                ; preds = %3
  %6 = trunc i32 %1 to i8
  br label %7

7:                                                ; preds = %5, %7
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

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i32(i8* nocapture, i8* nocapture readonly, i32, i1 immarg) #3

attributes #0 = { nofree norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+exception-handling,+reference-types" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { norecurse nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+exception-handling,+reference-types" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+exception-handling,+reference-types" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { nofree norecurse nounwind writeonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+exception-handling,+reference-types" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"clang version 11.1.0"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
