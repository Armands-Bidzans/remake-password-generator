; ModuleID = './src/log.c'
source_filename = "./src/log.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32"

; Function Attrs: nounwind
define hidden void @lstr(i8* nocapture readonly %0) local_unnamed_addr #0 {
  %2 = tail call i32 @strlen(i8* nonnull dereferenceable(1) %0)
  %3 = tail call i32 @lognc() #3
  %4 = icmp eq i32 %2, 0
  br i1 %4, label %11, label %5

5:                                                ; preds = %1, %5
  %6 = phi i32 [ %9, %5 ], [ 0, %1 ]
  %7 = getelementptr i8, i8* %0, i32 %6
  %8 = load i8, i8* %7, align 1, !tbaa !3
  tail call void @logfc(i32 %3, i8 signext %8) #3
  %9 = add nuw i32 %6, 1
  %10 = icmp eq i32 %9, %2
  br i1 %10, label %11, label %5

11:                                               ; preds = %5, %1
  tail call void @logpc(i32 %3) #3
  ret void
}

; Function Attrs: argmemonly nofree nounwind readonly
declare i32 @strlen(i8* nocapture) local_unnamed_addr #1

declare i32 @lognc() local_unnamed_addr #2

declare void @logfc(i32, i8 signext) local_unnamed_addr #2

declare void @logpc(i32) local_unnamed_addr #2

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+exception-handling,+reference-types" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nofree nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+exception-handling,+reference-types" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+exception-handling,+reference-types" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"clang version 11.1.0"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
