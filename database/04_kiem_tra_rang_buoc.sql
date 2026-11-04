/* =====================================================================
   04_kiem_tra_rang_buoc.sql
   Thu cac thao tac VI PHAM rang buoc: moi cau lenh duoc bao bang TRY...CATCH,
   ket qua dung la "[DUNG] ... bi tu choi". Neu thay "[LOI]" nghia la rang buoc
   chua hoat dong. Toan bo file chay trong mot giao dich va ROLLBACK o cuoi
   nen KHONG lam thay doi du lieu. Chay SAU 02 va 03. Xem ket qua o tab Messages.
   ===================================================================== */
USE ThiTracNghiem;
GO
SET NOCOUNT ON;
SET XACT_ABORT OFF;
BEGIN TRANSACTION;

-- 1. Trùng email tài khoản (UQ_tai_khoan_email)
BEGIN TRY
    INSERT INTO tai_khoan (ma_nguoi_dung, ho_ten, email, mat_khau_bam) VALUES ('SV099', N'Test', 'qt001@truong.edu.vn', 'x');
    PRINT N'[LỖI] 1. Trùng email tài khoản (UQ_tai_khoan_email): câu lệnh được chấp nhận, ràng buộc chưa hoạt động';
END TRY
BEGIN CATCH
    PRINT N'[ĐÚNG] 1. Trùng email tài khoản (UQ_tai_khoan_email): bị từ chối - ' + ERROR_MESSAGE();
END CATCH;

-- 2. Trạng thái tài khoản ngoài danh sách (CK_tai_khoan_trang_thai)
BEGIN TRY
    INSERT INTO tai_khoan (ma_nguoi_dung, ho_ten, email, mat_khau_bam, trang_thai) VALUES ('SV098', N'Test', 'sv098@truong.edu.vn', 'x', 'XOA');
    PRINT N'[LỖI] 2. Trạng thái tài khoản ngoài danh sách (CK_tai_khoan_trang_thai): câu lệnh được chấp nhận, ràng buộc chưa hoạt động';
END TRY
BEGIN CATCH
    PRINT N'[ĐÚNG] 2. Trạng thái tài khoản ngoài danh sách (CK_tai_khoan_trang_thai): bị từ chối - ' + ERROR_MESSAGE();
END CATCH;

-- 3. Mức độ ngoài ba giá trị chuẩn (CK_muc_do_ma)
BEGIN TRY
    INSERT INTO muc_do (ma_muc_do, ten_muc_do, nhan_do_kho) VALUES ('RAT_KHO', N'Rất khó', N'Rất khó');
    PRINT N'[LỖI] 3. Mức độ ngoài ba giá trị chuẩn (CK_muc_do_ma): câu lệnh được chấp nhận, ràng buộc chưa hoạt động';
END TRY
BEGIN CATCH
    PRINT N'[ĐÚNG] 3. Mức độ ngoài ba giá trị chuẩn (CK_muc_do_ma): bị từ chối - ' + ERROR_MESSAGE();
END CATCH;

-- 4. Câu hỏi dùng mức độ không tồn tại (FK_cau_hoi_muc_do)
BEGIN TRY
    INSERT INTO cau_hoi (ma_cau_hoi, ma_chu_de, ma_loai, ma_muc_do, noi_dung, ma_nguoi_tao) VALUES ('CH900', 'CD01', 'MOT_DAP_AN', 'RAT_KHO', N'Test', 'GV001');
    PRINT N'[LỖI] 4. Câu hỏi dùng mức độ không tồn tại (FK_cau_hoi_muc_do): câu lệnh được chấp nhận, ràng buộc chưa hoạt động';
END TRY
BEGIN CATCH
    PRINT N'[ĐÚNG] 4. Câu hỏi dùng mức độ không tồn tại (FK_cau_hoi_muc_do): bị từ chối - ' + ERROR_MESSAGE();
END CATCH;

-- 5. Câu hỏi thuộc chủ đề không tồn tại (FK_cau_hoi_chu_de)
BEGIN TRY
    INSERT INTO cau_hoi (ma_cau_hoi, ma_chu_de, ma_loai, ma_muc_do, noi_dung, ma_nguoi_tao) VALUES ('CH901', 'CD99', 'MOT_DAP_AN', 'NHAN_BIET', N'Test', 'GV001');
    PRINT N'[LỖI] 5. Câu hỏi thuộc chủ đề không tồn tại (FK_cau_hoi_chu_de): câu lệnh được chấp nhận, ràng buộc chưa hoạt động';
END TRY
BEGIN CATCH
    PRINT N'[ĐÚNG] 5. Câu hỏi thuộc chủ đề không tồn tại (FK_cau_hoi_chu_de): bị từ chối - ' + ERROR_MESSAGE();
END CATCH;

-- 6. Câu hỏi thiếu nội dung (NOT NULL)
BEGIN TRY
    INSERT INTO cau_hoi (ma_cau_hoi, ma_chu_de, ma_loai, ma_muc_do, ma_nguoi_tao) VALUES ('CH902', 'CD01', 'MOT_DAP_AN', 'NHAN_BIET', 'GV001');
    PRINT N'[LỖI] 6. Câu hỏi thiếu nội dung (NOT NULL): câu lệnh được chấp nhận, ràng buộc chưa hoạt động';
END TRY
BEGIN CATCH
    PRINT N'[ĐÚNG] 6. Câu hỏi thiếu nội dung (NOT NULL): bị từ chối - ' + ERROR_MESSAGE();
END CATCH;

-- 7. Trạng thái câu hỏi ngoài danh sách (CK_cau_hoi_trang_thai)
BEGIN TRY
    INSERT INTO cau_hoi (ma_cau_hoi, ma_chu_de, ma_loai, ma_muc_do, noi_dung, trang_thai, ma_nguoi_tao) VALUES ('CH903', 'CD01', 'MOT_DAP_AN', 'NHAN_BIET', N'Test', 'XOA', 'GV001');
    PRINT N'[LỖI] 7. Trạng thái câu hỏi ngoài danh sách (CK_cau_hoi_trang_thai): câu lệnh được chấp nhận, ràng buộc chưa hoạt động';
END TRY
BEGIN CATCH
    PRINT N'[ĐÚNG] 7. Trạng thái câu hỏi ngoài danh sách (CK_cau_hoi_trang_thai): bị từ chối - ' + ERROR_MESSAGE();
END CATCH;

-- 8. Ký hiệu đáp án ngoài A-E (CK_dap_an_ky_hieu)
BEGIN TRY
    INSERT INTO dap_an (ma_cau_hoi, ky_hieu, noi_dung) VALUES ('CH001', 'Z', N'Test');
    PRINT N'[LỖI] 8. Ký hiệu đáp án ngoài A-E (CK_dap_an_ky_hieu): câu lệnh được chấp nhận, ràng buộc chưa hoạt động';
END TRY
BEGIN CATCH
    PRINT N'[ĐÚNG] 8. Ký hiệu đáp án ngoài A-E (CK_dap_an_ky_hieu): bị từ chối - ' + ERROR_MESSAGE();
END CATCH;

-- 9. Trùng khóa chính của đáp án (PK_dap_an)
BEGIN TRY
    INSERT INTO dap_an (ma_cau_hoi, ky_hieu, noi_dung) VALUES ('CH001', 'A', N'Test');
    PRINT N'[LỖI] 9. Trùng khóa chính của đáp án (PK_dap_an): câu lệnh được chấp nhận, ràng buộc chưa hoạt động';
END TRY
BEGIN CATCH
    PRINT N'[ĐÚNG] 9. Trùng khóa chính của đáp án (PK_dap_an): bị từ chối - ' + ERROR_MESSAGE();
END CATCH;

-- 10. Ma trận đã duyệt nhưng chưa có người duyệt (CK_ma_tran_nguoi_duyet)
BEGIN TRY
    INSERT INTO ma_tran_de (ma_tran, ten_ma_tran, ma_mon_hoc, trang_thai, ma_nguoi_lap) VALUES ('MT900', N'Test', 'MH01', 'DA_DUYET', 'CBKT001');
    PRINT N'[LỖI] 10. Ma trận đã duyệt nhưng chưa có người duyệt (CK_ma_tran_nguoi_duyet): câu lệnh được chấp nhận, ràng buộc chưa hoạt động';
END TRY
BEGIN CATCH
    PRINT N'[ĐÚNG] 10. Ma trận đã duyệt nhưng chưa có người duyệt (CK_ma_tran_nguoi_duyet): bị từ chối - ' + ERROR_MESSAGE();
END CATCH;

-- 11. Số câu trong ma trận phải lớn hơn 0 (CK_ma_tran_chi_tiet_so_cau)
BEGIN TRY
    INSERT INTO ma_tran_chi_tiet (ma_tran, ma_chu_de, ma_muc_do, so_cau) VALUES ('MT03', 'CD03', 'NHAN_BIET', 0);
    PRINT N'[LỖI] 11. Số câu trong ma trận phải lớn hơn 0 (CK_ma_tran_chi_tiet_so_cau): câu lệnh được chấp nhận, ràng buộc chưa hoạt động';
END TRY
BEGIN CATCH
    PRINT N'[ĐÚNG] 11. Số câu trong ma trận phải lớn hơn 0 (CK_ma_tran_chi_tiet_so_cau): bị từ chối - ' + ERROR_MESSAGE();
END CATCH;

-- 12. Trùng chủ đề và mức độ trong cùng ma trận (PK_ma_tran_chi_tiet)
BEGIN TRY
    INSERT INTO ma_tran_chi_tiet (ma_tran, ma_chu_de, ma_muc_do, so_cau) VALUES ('MT01', 'CD01', 'NHAN_BIET', 1);
    PRINT N'[LỖI] 12. Trùng chủ đề và mức độ trong cùng ma trận (PK_ma_tran_chi_tiet): câu lệnh được chấp nhận, ràng buộc chưa hoạt động';
END TRY
BEGIN CATCH
    PRINT N'[ĐÚNG] 12. Trùng chủ đề và mức độ trong cùng ma trận (PK_ma_tran_chi_tiet): bị từ chối - ' + ERROR_MESSAGE();
END CATCH;

-- 13. Thời lượng ca thi phải lớn hơn 0 (CK_ca_thi_thoi_luong)
BEGIN TRY
    INSERT INTO ca_thi (ma_ca_thi, ma_ky_thi, ma_lop_hp, ma_tran, ma_can_bo_khao_thi, thoi_gian_bat_dau, thoi_luong_phut) VALUES ('CT900', 'KT01', 'LHP01', 'MT01', 'CBKT001', '2026-12-10T08:00:00', 0);
    PRINT N'[LỖI] 13. Thời lượng ca thi phải lớn hơn 0 (CK_ca_thi_thoi_luong): câu lệnh được chấp nhận, ràng buộc chưa hoạt động';
END TRY
BEGIN CATCH
    PRINT N'[ĐÚNG] 13. Thời lượng ca thi phải lớn hơn 0 (CK_ca_thi_thoi_luong): bị từ chối - ' + ERROR_MESSAGE();
END CATCH;

-- 14. Ca thi dùng lớp học phần không tồn tại (FK_ca_thi_lop_hp)
BEGIN TRY
    INSERT INTO ca_thi (ma_ca_thi, ma_ky_thi, ma_lop_hp, ma_tran, ma_can_bo_khao_thi, thoi_gian_bat_dau, thoi_luong_phut) VALUES ('CT901', 'KT01', 'LHP99', 'MT01', 'CBKT001', '2026-12-10T08:00:00', 45);
    PRINT N'[LỖI] 14. Ca thi dùng lớp học phần không tồn tại (FK_ca_thi_lop_hp): câu lệnh được chấp nhận, ràng buộc chưa hoạt động';
END TRY
BEGIN CATCH
    PRINT N'[ĐÚNG] 14. Ca thi dùng lớp học phần không tồn tại (FK_ca_thi_lop_hp): bị từ chối - ' + ERROR_MESSAGE();
END CATCH;

-- 15. Đề đã chốt nhưng chưa có người chốt (CK_de_thi_nguoi_chot)
BEGIN TRY
    INSERT INTO de_thi (ma_de_thi, ma_ca_thi, trang_thai) VALUES ('DT900', 'CT02', 'DA_CHOT');
    PRINT N'[LỖI] 15. Đề đã chốt nhưng chưa có người chốt (CK_de_thi_nguoi_chot): câu lệnh được chấp nhận, ràng buộc chưa hoạt động';
END TRY
BEGIN CATCH
    PRINT N'[ĐÚNG] 15. Đề đã chốt nhưng chưa có người chốt (CK_de_thi_nguoi_chot): bị từ chối - ' + ERROR_MESSAGE();
END CATCH;

-- 16. Trùng thứ tự câu hỏi trong đề (UQ_de_thi_cau_hoi_thu_tu)
BEGIN TRY
    INSERT INTO de_thi_cau_hoi (ma_de_thi, ma_cau_hoi, thu_tu) VALUES ('DT01', 'CH002', 1);
    PRINT N'[LỖI] 16. Trùng thứ tự câu hỏi trong đề (UQ_de_thi_cau_hoi_thu_tu): câu lệnh được chấp nhận, ràng buộc chưa hoạt động';
END TRY
BEGIN CATCH
    PRINT N'[ĐÚNG] 16. Trùng thứ tự câu hỏi trong đề (UQ_de_thi_cau_hoi_thu_tu): bị từ chối - ' + ERROR_MESSAGE();
END CATCH;

-- 17. Một sinh viên làm hai bài trong cùng ca thi (UQ_bai_thi_ca_sinh_vien)
BEGIN TRY
    INSERT INTO bai_thi (ma_bai_thi, ma_ca_thi, ma_de_thi, ma_sinh_vien, thoi_diem_bat_dau) VALUES ('BT900', 'CT01', 'DT01', 'SV001', '2026-10-20T09:00:00');
    PRINT N'[LỖI] 17. Một sinh viên làm hai bài trong cùng ca thi (UQ_bai_thi_ca_sinh_vien): câu lệnh được chấp nhận, ràng buộc chưa hoạt động';
END TRY
BEGIN CATCH
    PRINT N'[ĐÚNG] 17. Một sinh viên làm hai bài trong cùng ca thi (UQ_bai_thi_ca_sinh_vien): bị từ chối - ' + ERROR_MESSAGE();
END CATCH;

-- 18. Điểm lớn hơn 10 (CK_bai_thi_diem)
BEGIN TRY
    INSERT INTO bai_thi (ma_bai_thi, ma_ca_thi, ma_de_thi, ma_sinh_vien, thoi_diem_bat_dau, diem) VALUES ('BT901', 'CT01', 'DT01', 'SV005', '2026-10-20T09:00:00', 11);
    PRINT N'[LỖI] 18. Điểm lớn hơn 10 (CK_bai_thi_diem): câu lệnh được chấp nhận, ràng buộc chưa hoạt động';
END TRY
BEGIN CATCH
    PRINT N'[ĐÚNG] 18. Điểm lớn hơn 10 (CK_bai_thi_diem): bị từ chối - ' + ERROR_MESSAGE();
END CATCH;

-- 19. Chọn đáp án không tồn tại trong câu hỏi (FK_btct_dap_an)
BEGIN TRY
    INSERT INTO bai_thi_chi_tiet (ma_bai_thi, ma_cau_hoi, ky_hieu_chon) VALUES ('BT_CT01_SV001', 'CH001', 'E');
    PRINT N'[LỖI] 19. Chọn đáp án không tồn tại trong câu hỏi (FK_btct_dap_an): câu lệnh được chấp nhận, ràng buộc chưa hoạt động';
END TRY
BEGIN CATCH
    PRINT N'[ĐÚNG] 19. Chọn đáp án không tồn tại trong câu hỏi (FK_btct_dap_an): bị từ chối - ' + ERROR_MESSAGE();
END CATCH;

-- 20. Học kỳ kết thúc trước ngày bắt đầu (CK_hoc_ky_ngay)
BEGIN TRY
    INSERT INTO hoc_ky (ma_hoc_ky, ten_hoc_ky, ngay_bat_dau, ngay_ket_thuc) VALUES ('HK_SAI', N'Học kỳ sai', '2027-01-01', '2026-09-01');
    PRINT N'[LỖI] 20. Học kỳ kết thúc trước ngày bắt đầu (CK_hoc_ky_ngay): câu lệnh được chấp nhận, ràng buộc chưa hoạt động';
END TRY
BEGIN CATCH
    PRINT N'[ĐÚNG] 20. Học kỳ kết thúc trước ngày bắt đầu (CK_hoc_ky_ngay): bị từ chối - ' + ERROR_MESSAGE();
END CATCH;

-- 21. Xóa môn học đang có dữ liệu liên quan (FK)
BEGIN TRY
    DELETE FROM mon_hoc WHERE ma_mon_hoc = 'MH01';
    PRINT N'[LỖI] 21. Xóa môn học đang có dữ liệu liên quan (FK): câu lệnh được chấp nhận, ràng buộc chưa hoạt động';
END TRY
BEGIN CATCH
    PRINT N'[ĐÚNG] 21. Xóa môn học đang có dữ liệu liên quan (FK): bị từ chối - ' + ERROR_MESSAGE();
END CATCH;

-- 22. Xóa tài khoản đã tạo câu hỏi (FK)
BEGIN TRY
    DELETE FROM tai_khoan WHERE ma_nguoi_dung = 'GV001';
    PRINT N'[LỖI] 22. Xóa tài khoản đã tạo câu hỏi (FK): câu lệnh được chấp nhận, ràng buộc chưa hoạt động';
END TRY
BEGIN CATCH
    PRINT N'[ĐÚNG] 22. Xóa tài khoản đã tạo câu hỏi (FK): bị từ chối - ' + ERROR_MESSAGE();
END CATCH;

-- 23. Kiem tra xoa day chuyen (CASCADE): xoa ma tran nhap thi chi tiet ma tran bi xoa theo
BEGIN TRY
    DELETE FROM ma_tran_de WHERE ma_tran = 'MT03';
    IF NOT EXISTS (SELECT 1 FROM ma_tran_chi_tiet WHERE ma_tran = 'MT03')
        PRINT N'[ĐÚNG] 23. Xóa ma trận MT03 thì chi tiết ma trận bị xóa theo (ON DELETE CASCADE)';
    ELSE
        PRINT N'[LỖI] 23. Chi tiết ma trận vẫn còn sau khi xóa ma trận';
END TRY
BEGIN CATCH
    PRINT N'[LỖI] 23. ' + ERROR_MESSAGE();
END CATCH;

-- Hoan tac moi thay doi cua file nay
IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
PRINT N'Đã ROLLBACK: dữ liệu không bị thay đổi.';
GO