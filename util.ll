; ModuleID = './src/util.c'
source_filename = "./src/util.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32"

; Function Attrs: norecurse nounwind readonly
define hidden i32 @strlen(i8* %0) local_unnamed_addr #0 {
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

16:                                               ; preds = %5, %8
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

66:                                               ; preds = %38, %45, %53, %62, %13
  %67 = phi i32 [ %15, %13 ], [ %40, %38 ], [ %48, %45 ], [ %56, %53 ], [ %65, %62 ]
  ret i32 %67
}

attributes #0 = { norecurse nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+exception-handling,+reference-types" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"clang version 11.1.0"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"long", !4, i64 0}
