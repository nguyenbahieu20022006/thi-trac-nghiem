/* =====================================================================
   03_du_lieu_mau.sql
   Nap du lieu mau de thu cac chuc nang. Chay SAU 02_tao_bang.sql.
   Thu tu: bang cha truoc, bang con sau. Mat khau chi la chuoi gia (da "bam" gia lap).
   ===================================================================== */
USE ThiTracNghiem;
GO
SET NOCOUNT ON;
GO

INSERT INTO vai_tro (ma_vai_tro, ten_vai_tro) VALUES
    ('QT_HE_THONG', N'Quản trị hệ thống'),
    ('GIANG_VIEN', N'Giảng viên'),
    ('TRUONG_BO_MON', N'Trưởng bộ môn/Hội đồng chuyên môn'),
    ('CAN_BO_KHAO_THI', N'Cán bộ khảo thí'),
    ('SINH_VIEN', N'Sinh viên'),
    ('PHONG_DAO_TAO', N'Phòng Đào tạo'),
    ('TT_DBCL', N'Trung tâm Đảm bảo chất lượng'),
    ('BAN_GIAM_HIEU', N'Ban Giám hiệu'),
    ('PHONG_TONG_HOP', N'Phòng Tổng hợp');

INSERT INTO tai_khoan (ma_nguoi_dung, ho_ten, email, mat_khau_bam, trang_thai, so_lan_dang_nhap_sai) VALUES
    ('QT001', N'Nguyễn Văn An', 'qt001@truong.edu.vn', 'HASH_MAU_QT001', 'HOAT_DONG', 0),
    ('GV001', N'Trần Thị Bình', 'gv001@truong.edu.vn', 'HASH_MAU_GV001', 'HOAT_DONG', 0),
    ('GV002', N'Phạm Quốc Khánh', 'gv002@truong.edu.vn', 'HASH_MAU_GV002', 'HOAT_DONG', 0),
    ('TBM001', N'Lê Thị Hoa', 'tbm001@truong.edu.vn', 'HASH_MAU_TBM001', 'HOAT_DONG', 0),
    ('CBKT001', N'Đỗ Minh Tuấn', 'cbkt001@truong.edu.vn', 'HASH_MAU_CBKT001', 'HOAT_DONG', 0),
    ('PDT001', N'Vũ Thị Lan', 'pdt001@truong.edu.vn', 'HASH_MAU_PDT001', 'HOAT_DONG', 0),
    ('DBCL001', N'Hoàng Văn Nam', 'dbcl001@truong.edu.vn', 'HASH_MAU_DBCL001', 'HOAT_DONG', 0),
    ('BGH001', N'Ngô Thanh Sơn', 'bgh001@truong.edu.vn', 'HASH_MAU_BGH001', 'HOAT_DONG', 0),
    ('PTH001', N'Bùi Thị Mai', 'pth001@truong.edu.vn', 'HASH_MAU_PTH001', 'HOAT_DONG', 0),
    ('SV001', N'Nguyễn Hữu Phúc', 'sv001@truong.edu.vn', 'HASH_MAU_SV001', 'HOAT_DONG', 0),
    ('SV002', N'Trần Gia Bảo', 'sv002@truong.edu.vn', 'HASH_MAU_SV002', 'HOAT_DONG', 0),
    ('SV003', N'Lê Ngọc Anh', 'sv003@truong.edu.vn', 'HASH_MAU_SV003', 'HOAT_DONG', 0),
    ('SV004', N'Phạm Minh Châu', 'sv004@truong.edu.vn', 'HASH_MAU_SV004', 'HOAT_DONG', 0),
    ('SV005', N'Đỗ Thanh Hà', 'sv005@truong.edu.vn', 'HASH_MAU_SV005', 'BI_KHOA', 5);

INSERT INTO tai_khoan_vai_tro (ma_nguoi_dung, ma_vai_tro) VALUES
    ('QT001', 'QT_HE_THONG'),
    ('GV001', 'GIANG_VIEN'),
    ('GV002', 'GIANG_VIEN'),
    ('TBM001', 'TRUONG_BO_MON'),
    ('TBM001', 'GIANG_VIEN'),
    ('CBKT001', 'CAN_BO_KHAO_THI'),
    ('PDT001', 'PHONG_DAO_TAO'),
    ('DBCL001', 'TT_DBCL'),
    ('BGH001', 'BAN_GIAM_HIEU'),
    ('PTH001', 'PHONG_TONG_HOP'),
    ('SV001', 'SINH_VIEN'),
    ('SV002', 'SINH_VIEN'),
    ('SV003', 'SINH_VIEN'),
    ('SV004', 'SINH_VIEN'),
    ('SV005', 'SINH_VIEN');

INSERT INTO bo_mon (ma_bo_mon, ten_bo_mon, ten_khoa) VALUES
    ('BM01', N'Hệ thống thông tin', N'Công nghệ thông tin');

INSERT INTO mon_hoc (ma_mon_hoc, ten_mon_hoc, ma_bo_mon) VALUES
    ('MH01', N'Phân tích thiết kế hệ thống', 'BM01'),
    ('MH02', N'Cơ sở dữ liệu', 'BM01');

INSERT INTO hoc_ky (ma_hoc_ky, ten_hoc_ky, ngay_bat_dau, ngay_ket_thuc) VALUES
    ('HK1_2026', N'Học kỳ 1 năm học 2026-2027', '2026-09-01', '2027-01-15');

INSERT INTO lop_hoc_phan (ma_lop_hp, ma_mon_hoc, ma_hoc_ky, ten_lop, ma_giang_vien) VALUES
    ('LHP01', 'MH01', 'HK1_2026', N'Phân tích thiết kế hệ thống - Nhóm 01', 'GV001'),
    ('LHP02', 'MH02', 'HK1_2026', N'Cơ sở dữ liệu - Nhóm 01', 'GV002');

INSERT INTO sinh_vien_lop_hp (ma_lop_hp, ma_sinh_vien, du_dieu_kien_thi) VALUES
    ('LHP01', 'SV001', 1),
    ('LHP01', 'SV002', 1),
    ('LHP01', 'SV003', 1),
    ('LHP01', 'SV004', 1),
    ('LHP01', 'SV005', 0),
    ('LHP02', 'SV001', 1),
    ('LHP02', 'SV002', 1),
    ('LHP02', 'SV003', 1);

INSERT INTO chu_de (ma_chu_de, ma_mon_hoc, ten_chu_de) VALUES
    ('CD01', 'MH01', N'Use Case'),
    ('CD02', 'MH01', N'Sơ đồ thực thể quan hệ (ERD)'),
    ('CD03', 'MH01', N'Phân tích yêu cầu'),
    ('CD04', 'MH02', N'Truy vấn SQL cơ bản'),
    ('CD05', 'MH02', N'Chuẩn hóa dữ liệu');

INSERT INTO muc_do (ma_muc_do, ten_muc_do, nhan_do_kho) VALUES
    ('NHAN_BIET', N'Nhận biết', N'Dễ'),
    ('THONG_HIEU', N'Thông hiểu', N'Trung bình'),
    ('VAN_DUNG', N'Vận dụng', N'Khó');

INSERT INTO loai_cau_hoi (ma_loai, ten_loai) VALUES
    ('MOT_DAP_AN', N'Một đáp án đúng'),
    ('NHIEU_DAP_AN', N'Nhiều đáp án đúng');

INSERT INTO cau_hoi (ma_cau_hoi, ma_chu_de, ma_loai, ma_muc_do, noi_dung, trang_thai, ma_nguoi_tao) VALUES
    ('CH001', 'CD01', 'MOT_DAP_AN', 'NHAN_BIET', N'Actor trong sơ đồ Use Case là gì?', 'DA_PHE_DUYET', 'GV001'),
    ('CH002', 'CD01', 'MOT_DAP_AN', 'NHAN_BIET', N'Quan hệ nào cho biết một Use Case luôn gọi một Use Case khác để hoàn thành chức năng của mình?', 'DA_PHE_DUYET', 'GV001'),
    ('CH003', 'CD01', 'MOT_DAP_AN', 'THONG_HIEU', N'Quan hệ <<extend>> giữa hai Use Case có ý nghĩa gì?', 'DA_PHE_DUYET', 'GV001'),
    ('CH004', 'CD01', 'MOT_DAP_AN', 'VAN_DUNG', N'Chức năng “Quên mật khẩu” chỉ xảy ra khi người dùng chọn trong lúc đăng nhập. Nên biểu diễn quan hệ từ “Quên mật khẩu” tới “Đăng nhập” bằng loại nào?', 'DA_PHE_DUYET', 'GV001'),
    ('CH005', 'CD02', 'MOT_DAP_AN', 'NHAN_BIET', N'Khóa chính của một bảng dùng để làm gì?', 'DA_PHE_DUYET', 'GV001'),
    ('CH006', 'CD02', 'MOT_DAP_AN', 'NHAN_BIET', N'Khóa ngoại thể hiện điều gì?', 'DA_PHE_DUYET', 'GV001'),
    ('CH007', 'CD02', 'MOT_DAP_AN', 'THONG_HIEU', N'Quan hệ nhiều-nhiều giữa hai thực thể thường được chuyển sang mô hình quan hệ bằng cách nào?', 'DA_PHE_DUYET', 'GV001'),
    ('CH008', 'CD02', 'MOT_DAP_AN', 'VAN_DUNG', N'Một sinh viên học nhiều lớp học phần, một lớp học phần có nhiều sinh viên. Cách thiết kế bảng nào phù hợp nhất?', 'DA_PHE_DUYET', 'GV001'),
    ('CH009', 'CD03', 'MOT_DAP_AN', 'NHAN_BIET', N'Yêu cầu phi chức năng mô tả điều gì?', 'DA_PHE_DUYET', 'GV001'),
    ('CH010', 'CD03', 'MOT_DAP_AN', 'THONG_HIEU', N'Yêu cầu nào sau đây là yêu cầu phi chức năng?', 'DA_PHE_DUYET', 'GV001'),
    ('CH011', 'CD03', 'MOT_DAP_AN', 'VAN_DUNG', N'Yêu cầu “Cán bộ khảo thí lập lịch thi” thuộc loại nào và liên quan đến Actor nào?', 'DA_PHE_DUYET', 'GV001'),
    ('CH012', 'CD03', 'MOT_DAP_AN', 'THONG_HIEU', N'Mục đích của việc rà soát yêu cầu là gì?', 'CHO_THAM_DINH', 'GV001'),
    ('CH013', 'CD04', 'MOT_DAP_AN', 'NHAN_BIET', N'Câu lệnh SQL nào dùng để truy vấn dữ liệu từ bảng?', 'DA_PHE_DUYET', 'GV002'),
    ('CH014', 'CD04', 'MOT_DAP_AN', 'NHAN_BIET', N'Mệnh đề nào dùng để lọc các dòng theo điều kiện?', 'DA_PHE_DUYET', 'GV002'),
    ('CH015', 'CD04', 'MOT_DAP_AN', 'THONG_HIEU', N'Sự khác nhau giữa WHERE và HAVING là gì?', 'DA_PHE_DUYET', 'GV002'),
    ('CH016', 'CD04', 'MOT_DAP_AN', 'THONG_HIEU', N'Kết quả của INNER JOIN giữa hai bảng là gì?', 'DA_PHE_DUYET', 'GV002'),
    ('CH017', 'CD04', 'MOT_DAP_AN', 'VAN_DUNG', N'Cần đếm số câu hỏi theo từng mức độ. Câu lệnh nào đúng?', 'DA_PHE_DUYET', 'GV002'),
    ('CH018', 'CD04', 'MOT_DAP_AN', 'VAN_DUNG', N'Muốn liệt kê các câu hỏi chưa được đưa vào đề thi nào, cách nào đúng?', 'DA_PHE_DUYET', 'GV002'),
    ('CH019', 'CD05', 'MOT_DAP_AN', 'NHAN_BIET', N'Dạng chuẩn 1 (1NF) yêu cầu điều gì?', 'DA_PHE_DUYET', 'GV002'),
    ('CH020', 'CD05', 'MOT_DAP_AN', 'THONG_HIEU', N'Phụ thuộc hàm bắc cầu là nguyên nhân vi phạm dạng chuẩn nào?', 'TRA_CHINH_SUA', 'GV002'),
    ('CH021', 'CD05', 'MOT_DAP_AN', 'THONG_HIEU', N'Mục đích chính của chuẩn hóa dữ liệu là gì?', 'DA_PHE_DUYET', 'GV002'),
    ('CH022', 'CD05', 'MOT_DAP_AN', 'VAN_DUNG', N'Bảng chi_tiet_don(ma_don, ma_sp, ten_sp, so_luong) có khóa chính (ma_don, ma_sp) và ten_sp chỉ phụ thuộc vào ma_sp. Bảng này vi phạm dạng chuẩn nào?', 'DA_PHE_DUYET', 'GV002'),
    ('CH023', 'CD05', 'MOT_DAP_AN', 'VAN_DUNG', N'Bảng sinh_vien(ma_sv, ho_ten, ma_lop, ten_lop) có ten_lop phụ thuộc vào ma_lop. Cách xử lý đúng là gì?', 'NHAP', 'GV002'),
    ('CH024', 'CD04', 'MOT_DAP_AN', 'NHAN_BIET', N'Ràng buộc UNIQUE dùng để làm gì?', 'DA_PHE_DUYET', 'GV002'),
    ('CH025', 'CD01', 'NHIEU_DAP_AN', 'NHAN_BIET', N'Chọn các đối tượng là Actor của hệ thống thi trắc nghiệm trực tuyến:', 'DA_PHE_DUYET', 'GV001');

INSERT INTO dap_an (ma_cau_hoi, ky_hieu, noi_dung, la_dung) VALUES
    ('CH001', 'A', N'Đối tượng bên ngoài tương tác với hệ thống', 1),
    ('CH001', 'B', N'Một bảng trong cơ sở dữ liệu', 0),
    ('CH001', 'C', N'Một hàm trong chương trình', 0),
    ('CH001', 'D', N'Một lớp trong sơ đồ lớp', 0),
    ('CH002', 'A', N'<<extend>>', 0),
    ('CH002', 'B', N'<<include>>', 1),
    ('CH002', 'C', N'Tổng quát hóa (Generalization)', 0),
    ('CH002', 'D', N'Kết hợp (Association)', 0),
    ('CH003', 'A', N'Use Case gốc luôn gọi Use Case kia', 0),
    ('CH003', 'B', N'Hai Use Case có cùng một Actor', 0),
    ('CH003', 'C', N'Use Case mở rộng chỉ thực hiện khi thỏa một điều kiện nhất định', 1),
    ('CH003', 'D', N'Use Case gốc bị xóa khi Use Case kia chạy', 0),
    ('CH004', 'A', N'<<extend>>', 1),
    ('CH004', 'B', N'<<include>>', 0),
    ('CH004', 'C', N'Tổng quát hóa giữa hai Actor', 0),
    ('CH004', 'D', N'Không cần quan hệ nào', 0),
    ('CH005', 'A', N'Lưu mật khẩu của người dùng', 0),
    ('CH005', 'B', N'Xác định duy nhất mỗi dòng trong bảng', 1),
    ('CH005', 'C', N'Sắp xếp dữ liệu theo thứ tự chữ cái', 0),
    ('CH005', 'D', N'Tạo báo cáo từ dữ liệu', 0),
    ('CH006', 'A', N'Cột luôn chứa giá trị rỗng', 0),
    ('CH006', 'B', N'Cột có giá trị lớn nhất của bảng', 0),
    ('CH006', 'C', N'Cột dùng để mã hóa dữ liệu', 0),
    ('CH006', 'D', N'Cột liên kết với khóa chính của một bảng khác', 1),
    ('CH007', 'A', N'Tạo bảng trung gian chứa khóa ngoại tới cả hai bảng', 1),
    ('CH007', 'B', N'Gộp hai bảng thành một bảng', 0),
    ('CH007', 'C', N'Xóa một trong hai thực thể', 0),
    ('CH007', 'D', N'Thêm các cột trùng lặp vào cả hai bảng', 0),
    ('CH008', 'A', N'Thêm cột mã lớp học phần vào bảng sinh viên', 0),
    ('CH008', 'B', N'Thêm cột mã sinh viên vào bảng lớp học phần', 0),
    ('CH008', 'C', N'Tạo bảng trung gian có khóa chính gồm mã sinh viên và mã lớp học phần', 1),
    ('CH008', 'D', N'Dùng một bảng duy nhất không có khóa', 0),
    ('CH009', 'A', N'Danh sách các màn hình của hệ thống', 0),
    ('CH009', 'B', N'Các bảng dữ liệu cần tạo', 0),
    ('CH009', 'C', N'Mã nguồn của chương trình', 0),
    ('CH009', 'D', N'Các tiêu chí chất lượng như hiệu năng, bảo mật, độ tin cậy', 1),
    ('CH010', 'A', N'Hệ thống cho phép giảng viên tạo câu hỏi', 0),
    ('CH010', 'B', N'Hệ thống phản hồi trong vòng 3 giây khi có 500 người dùng truy cập đồng thời', 1),
    ('CH010', 'C', N'Hệ thống cho phép sinh viên nộp bài', 0),
    ('CH010', 'D', N'Hệ thống cho phép xem kết quả thi', 0),
    ('CH011', 'A', N'Chức năng; Cán bộ khảo thí', 1),
    ('CH011', 'B', N'Phi chức năng; Sinh viên', 0),
    ('CH011', 'C', N'Phi chức năng; Giảng viên', 0),
    ('CH011', 'D', N'Chức năng; Sinh viên', 0),
    ('CH012', 'A', N'Tăng số lượng yêu cầu', 0),
    ('CH012', 'B', N'Xóa các yêu cầu khó thực hiện', 0),
    ('CH012', 'C', N'Phát hiện yêu cầu thiếu, mâu thuẫn hoặc chưa rõ ràng', 1),
    ('CH012', 'D', N'Chuyển yêu cầu sang mã nguồn', 0),
    ('CH013', 'A', N'SELECT', 1),
    ('CH013', 'B', N'INSERT', 0),
    ('CH013', 'C', N'DELETE', 0),
    ('CH013', 'D', N'CREATE', 0),
    ('CH014', 'A', N'ORDER BY', 0),
    ('CH014', 'B', N'WHERE', 1),
    ('CH014', 'C', N'GROUP BY', 0),
    ('CH014', 'D', N'FROM', 0),
    ('CH015', 'A', N'Hai mệnh đề hoàn toàn giống nhau', 0),
    ('CH015', 'B', N'HAVING được dùng trước WHERE', 0),
    ('CH015', 'C', N'WHERE chỉ dùng cho khóa chính', 0),
    ('CH015', 'D', N'WHERE lọc dòng trước khi gom nhóm, HAVING lọc nhóm sau khi gom', 1),
    ('CH016', 'A', N'Tất cả dòng của bảng bên trái', 0),
    ('CH016', 'B', N'Tất cả dòng của cả hai bảng', 0),
    ('CH016', 'C', N'Các dòng có giá trị khớp ở cả hai bảng theo điều kiện nối', 1),
    ('CH016', 'D', N'Tích Descartes của hai bảng', 0),
    ('CH017', 'A', N'SELECT ma_muc_do, COUNT(*) FROM cau_hoi GROUP BY ma_muc_do;', 1),
    ('CH017', 'B', N'SELECT COUNT(*) FROM cau_hoi WHERE ma_muc_do;', 0),
    ('CH017', 'C', N'SELECT ma_muc_do FROM cau_hoi COUNT;', 0),
    ('CH017', 'D', N'SELECT SUM(ma_muc_do) FROM cau_hoi;', 0),
    ('CH018', 'A', N'INNER JOIN de_thi_cau_hoi rồi lọc giá trị khác rỗng', 0),
    ('CH018', 'B', N'LEFT JOIN de_thi_cau_hoi rồi lọc dòng có de_thi_cau_hoi.ma_cau_hoi IS NULL', 1),
    ('CH018', 'C', N'UNION cau_hoi với de_thi_cau_hoi', 0),
    ('CH018', 'D', N'TRUNCATE TABLE de_thi_cau_hoi', 0),
    ('CH019', 'A', N'Bảng không có khóa ngoại', 0),
    ('CH019', 'B', N'Bảng không có khóa chính', 0),
    ('CH019', 'C', N'Mọi cột đều là kiểu số', 0),
    ('CH019', 'D', N'Mỗi ô chứa một giá trị đơn, không có nhóm giá trị lặp', 1),
    ('CH020', 'A', N'1NF', 0),
    ('CH020', 'B', N'2NF', 0),
    ('CH020', 'C', N'3NF', 1),
    ('CH020', 'D', N'Không vi phạm dạng chuẩn nào', 0),
    ('CH021', 'A', N'Giảm dư thừa và tránh dị thường khi thêm, sửa, xóa dữ liệu', 1),
    ('CH021', 'B', N'Tăng dung lượng lưu trữ', 0),
    ('CH021', 'C', N'Làm truy vấn luôn chậm hơn', 0),
    ('CH021', 'D', N'Loại bỏ toàn bộ khóa ngoại', 0),
    ('CH022', 'A', N'1NF', 0),
    ('CH022', 'B', N'2NF', 1),
    ('CH022', 'C', N'3NF', 0),
    ('CH022', 'D', N'Không vi phạm dạng chuẩn nào', 0),
    ('CH023', 'A', N'Xóa cột ma_lop', 0),
    ('CH023', 'B', N'Xóa cột ho_ten', 0),
    ('CH023', 'C', N'Tách bảng lop(ma_lop, ten_lop), giữ ma_lop làm khóa ngoại trong sinh_vien', 1),
    ('CH023', 'D', N'Gộp ten_lop vào cột ho_ten', 0),
    ('CH024', 'A', N'Bắt buộc cột phải có giá trị', 0),
    ('CH024', 'B', N'Giới hạn giá trị tối đa của cột', 0),
    ('CH024', 'C', N'Tự động tăng giá trị của cột', 0),
    ('CH024', 'D', N'Không cho phép hai dòng có cùng giá trị ở cột đó', 1),
    ('CH025', 'A', N'Sinh viên', 1),
    ('CH025', 'B', N'Cán bộ khảo thí', 1),
    ('CH025', 'C', N'Bảng tai_khoan trong cơ sở dữ liệu', 0),
    ('CH025', 'D', N'Nút “Nộp bài” trên giao diện', 0);

INSERT INTO tham_dinh_cau_hoi (ma_cau_hoi, ma_nguoi_tham_dinh, ket_qua, nhan_xet) VALUES
    ('CH001', 'TBM001', 'DUYET', NULL),
    ('CH003', 'TBM001', 'DUYET', N'Đã chỉnh câu chữ cho rõ nghĩa'),
    ('CH013', 'TBM001', 'DUYET', NULL),
    ('CH020', 'TBM001', 'TRA_LAI', N'Phương án nhiễu chưa hợp lý, cần chỉnh sửa');

INSERT INTO lich_su_cau_hoi (ma_cau_hoi, ma_nguoi_sua, noi_dung_cu, ghi_chu) VALUES
    ('CH003', 'GV001', N'Quan hệ extend giữa hai Use Case nghĩa là gì?', N'Sửa câu hỏi cho rõ nghĩa');

INSERT INTO ma_tran_de (ma_tran, ten_ma_tran, ma_mon_hoc, trang_thai, ma_nguoi_lap, ma_nguoi_duyet, ngay_lap, ngay_duyet) VALUES
    ('MT01', N'Ma trận đề giữa kỳ Phân tích thiết kế hệ thống', 'MH01', 'DA_DUYET', 'CBKT001', 'TBM001', '2026-10-01T09:00:00', '2026-10-03T14:00:00'),
    ('MT02', N'Ma trận đề giữa kỳ Cơ sở dữ liệu', 'MH02', 'DA_DUYET', 'CBKT001', 'TBM001', '2026-10-01T09:30:00', '2026-10-03T14:30:00'),
    ('MT03', N'Ma trận đề cuối kỳ Phân tích thiết kế hệ thống (chờ duyệt)', 'MH01', 'CHO_DUYET', 'CBKT001', NULL, '2026-10-25T10:00:00', NULL);

INSERT INTO ma_tran_chi_tiet (ma_tran, ma_chu_de, ma_muc_do, so_cau) VALUES
    ('MT01', 'CD01', 'NHAN_BIET', 1),
    ('MT01', 'CD01', 'THONG_HIEU', 1),
    ('MT01', 'CD01', 'VAN_DUNG', 1),
    ('MT01', 'CD02', 'NHAN_BIET', 1),
    ('MT01', 'CD02', 'THONG_HIEU', 1),
    ('MT01', 'CD02', 'VAN_DUNG', 1),
    ('MT01', 'CD03', 'NHAN_BIET', 1),
    ('MT01', 'CD03', 'THONG_HIEU', 1),
    ('MT01', 'CD03', 'VAN_DUNG', 1),
    ('MT02', 'CD04', 'NHAN_BIET', 2),
    ('MT02', 'CD04', 'THONG_HIEU', 1),
    ('MT02', 'CD04', 'VAN_DUNG', 1),
    ('MT02', 'CD05', 'NHAN_BIET', 1),
    ('MT02', 'CD05', 'THONG_HIEU', 1),
    ('MT02', 'CD05', 'VAN_DUNG', 1),
    ('MT03', 'CD01', 'NHAN_BIET', 1),
    ('MT03', 'CD01', 'THONG_HIEU', 1),
    ('MT03', 'CD02', 'VAN_DUNG', 1);

INSERT INTO ky_thi (ma_ky_thi, ten_ky_thi, ma_hoc_ky) VALUES
    ('KT01', N'Thi giữa kỳ học kỳ 1 năm học 2026-2027', 'HK1_2026');

INSERT INTO ca_thi (ma_ca_thi, ma_ky_thi, ma_lop_hp, ma_tran, ma_can_bo_khao_thi, thoi_gian_bat_dau, thoi_luong_phut, trang_thai) VALUES
    ('CT01', 'KT01', 'LHP01', 'MT01', 'CBKT001', '2026-10-20T08:00:00', 45, 'KET_THUC'),
    ('CT02', 'KT01', 'LHP02', 'MT02', 'CBKT001', '2026-12-05T08:00:00', 45, 'CHUA_BAT_DAU');

INSERT INTO de_thi (ma_de_thi, ma_ca_thi, trang_thai, ma_nguoi_chot, ngay_sinh) VALUES
    ('DT01', 'CT01', 'DA_CHOT', 'CBKT001', '2026-10-10T10:00:00'),
    ('DT02', 'CT02', 'DA_SINH', NULL, '2026-11-20T10:00:00');

INSERT INTO de_thi_cau_hoi (ma_de_thi, ma_cau_hoi, thu_tu) VALUES
    ('DT01', 'CH001', 1),
    ('DT01', 'CH003', 2),
    ('DT01', 'CH004', 3),
    ('DT01', 'CH005', 4),
    ('DT01', 'CH007', 5),
    ('DT01', 'CH008', 6),
    ('DT01', 'CH009', 7),
    ('DT01', 'CH010', 8),
    ('DT01', 'CH011', 9),
    ('DT02', 'CH013', 1),
    ('DT02', 'CH014', 2),
    ('DT02', 'CH015', 3),
    ('DT02', 'CH017', 4),
    ('DT02', 'CH019', 5),
    ('DT02', 'CH021', 6),
    ('DT02', 'CH022', 7);

INSERT INTO bai_thi (ma_bai_thi, ma_ca_thi, ma_de_thi, ma_sinh_vien, thoi_diem_bat_dau, thoi_diem_nop, trang_thai, diem) VALUES
    ('BT_CT01_SV001', 'CT01', 'DT01', 'SV001', '2026-10-20T08:02:00', '2026-10-20T08:38:00', 'DA_NOP', 10.00),
    ('BT_CT01_SV002', 'CT01', 'DT01', 'SV002', '2026-10-20T08:01:00', '2026-10-20T08:41:00', 'DA_NOP', 8.89),
    ('BT_CT01_SV003', 'CT01', 'DT01', 'SV003', '2026-10-20T08:03:00', '2026-10-20T08:44:00', 'DA_NOP', 6.67),
    ('BT_CT01_SV004', 'CT01', 'DT01', 'SV004', '2026-10-20T08:02:00', '2026-10-20T08:35:00', 'DA_NOP', 7.78);

INSERT INTO bai_thi_chi_tiet (ma_bai_thi, ma_cau_hoi, ky_hieu_chon) VALUES
    ('BT_CT01_SV001', 'CH001', 'A'),
    ('BT_CT01_SV001', 'CH003', 'C'),
    ('BT_CT01_SV001', 'CH004', 'A'),
    ('BT_CT01_SV001', 'CH005', 'B'),
    ('BT_CT01_SV001', 'CH007', 'A'),
    ('BT_CT01_SV001', 'CH008', 'C'),
    ('BT_CT01_SV001', 'CH009', 'D'),
    ('BT_CT01_SV001', 'CH010', 'B'),
    ('BT_CT01_SV001', 'CH011', 'A'),
    ('BT_CT01_SV002', 'CH001', 'A'),
    ('BT_CT01_SV002', 'CH003', 'C'),
    ('BT_CT01_SV002', 'CH004', 'A'),
    ('BT_CT01_SV002', 'CH005', 'B'),
    ('BT_CT01_SV002', 'CH007', 'A'),
    ('BT_CT01_SV002', 'CH008', 'C'),
    ('BT_CT01_SV002', 'CH009', 'D'),
    ('BT_CT01_SV002', 'CH010', 'B'),
    ('BT_CT01_SV002', 'CH011', 'B'),
    ('BT_CT01_SV003', 'CH001', 'B'),
    ('BT_CT01_SV003', 'CH003', 'C'),
    ('BT_CT01_SV003', 'CH004', 'A'),
    ('BT_CT01_SV003', 'CH005', 'A'),
    ('BT_CT01_SV003', 'CH007', 'A'),
    ('BT_CT01_SV003', 'CH008', 'A'),
    ('BT_CT01_SV003', 'CH009', 'D'),
    ('BT_CT01_SV003', 'CH010', 'B'),
    ('BT_CT01_SV003', 'CH011', 'A'),
    ('BT_CT01_SV004', 'CH001', 'A'),
    ('BT_CT01_SV004', 'CH003', 'C'),
    ('BT_CT01_SV004', 'CH004', 'B'),
    ('BT_CT01_SV004', 'CH005', 'B'),
    ('BT_CT01_SV004', 'CH007', 'A'),
    ('BT_CT01_SV004', 'CH008', 'C'),
    ('BT_CT01_SV004', 'CH009', 'A'),
    ('BT_CT01_SV004', 'CH010', 'B'),
    ('BT_CT01_SV004', 'CH011', 'A');

INSERT INTO su_co_thi (ma_ca_thi, ma_bai_thi, loai_su_co, mo_ta, ma_nguoi_ghi, cach_xu_ly, trang_thai, thoi_diem) VALUES
    ('CT01', 'BT_CT01_SV003', 'MAT_KET_NOI', N'Sinh viên mất kết nối khoảng 2 phút giữa chừng', 'CBKT001', N'Khôi phục phiên thi, giữ nguyên bài làm', 'DA_XU_LY', '2026-10-20T08:20:00');

INSERT INTO nhat_ky (ma_nguoi_dung, hanh_dong, doi_tuong, chi_tiet) VALUES
    ('QT001', 'DANG_NHAP', 'tai_khoan', N'Đăng nhập thành công'),
    ('QT001', 'TAO_TAI_KHOAN', 'tai_khoan', N'Tạo tài khoản SV001'),
    (NULL, 'DANG_NHAP_THAT_BAI', 'tai_khoan', N'Sai mật khẩu tài khoản SV005'),
    ('TBM001', 'DUYET_MA_TRAN', 'ma_tran_de', N'Duyệt ma trận MT01'),
    ('CBKT001', 'CHOT_DE', 'de_thi', N'Chốt đề DT01');

GO

/* ---------- KIEM TRA NHANH SAU KHI NAP DU LIEU ---------- */
-- 1) So dong cua tung bang
SELECT 'vai_tro' AS bang, COUNT(*) AS so_dong FROM vai_tro
UNION ALL
SELECT 'tai_khoan' AS bang, COUNT(*) AS so_dong FROM tai_khoan
UNION ALL
SELECT 'tai_khoan_vai_tro' AS bang, COUNT(*) AS so_dong FROM tai_khoan_vai_tro
UNION ALL
SELECT 'nhat_ky' AS bang, COUNT(*) AS so_dong FROM nhat_ky
UNION ALL
SELECT 'bo_mon' AS bang, COUNT(*) AS so_dong FROM bo_mon
UNION ALL
SELECT 'mon_hoc' AS bang, COUNT(*) AS so_dong FROM mon_hoc
UNION ALL
SELECT 'hoc_ky' AS bang, COUNT(*) AS so_dong FROM hoc_ky
UNION ALL
SELECT 'lop_hoc_phan' AS bang, COUNT(*) AS so_dong FROM lop_hoc_phan
UNION ALL
SELECT 'sinh_vien_lop_hp' AS bang, COUNT(*) AS so_dong FROM sinh_vien_lop_hp
UNION ALL
SELECT 'chu_de' AS bang, COUNT(*) AS so_dong FROM chu_de
UNION ALL
SELECT 'muc_do' AS bang, COUNT(*) AS so_dong FROM muc_do
UNION ALL
SELECT 'loai_cau_hoi' AS bang, COUNT(*) AS so_dong FROM loai_cau_hoi
UNION ALL
SELECT 'cau_hoi' AS bang, COUNT(*) AS so_dong FROM cau_hoi
UNION ALL
SELECT 'dap_an' AS bang, COUNT(*) AS so_dong FROM dap_an
UNION ALL
SELECT 'tham_dinh_cau_hoi' AS bang, COUNT(*) AS so_dong FROM tham_dinh_cau_hoi
UNION ALL
SELECT 'lich_su_cau_hoi' AS bang, COUNT(*) AS so_dong FROM lich_su_cau_hoi
UNION ALL
SELECT 'ma_tran_de' AS bang, COUNT(*) AS so_dong FROM ma_tran_de
UNION ALL
SELECT 'ma_tran_chi_tiet' AS bang, COUNT(*) AS so_dong FROM ma_tran_chi_tiet
UNION ALL
SELECT 'ky_thi' AS bang, COUNT(*) AS so_dong FROM ky_thi
UNION ALL
SELECT 'ca_thi' AS bang, COUNT(*) AS so_dong FROM ca_thi
UNION ALL
SELECT 'de_thi' AS bang, COUNT(*) AS so_dong FROM de_thi
UNION ALL
SELECT 'de_thi_cau_hoi' AS bang, COUNT(*) AS so_dong FROM de_thi_cau_hoi
UNION ALL
SELECT 'bai_thi' AS bang, COUNT(*) AS so_dong FROM bai_thi
UNION ALL
SELECT 'bai_thi_chi_tiet' AS bang, COUNT(*) AS so_dong FROM bai_thi_chi_tiet
UNION ALL
SELECT 'su_co_thi' AS bang, COUNT(*) AS so_dong FROM su_co_thi;

-- 2) So cau hoi theo muc do va trang thai
SELECT md.ten_muc_do, md.nhan_do_kho, ch.trang_thai, COUNT(*) AS so_cau
FROM cau_hoi ch JOIN muc_do md ON md.ma_muc_do = ch.ma_muc_do
GROUP BY md.ten_muc_do, md.nhan_do_kho, ch.trang_thai
ORDER BY md.ten_muc_do, ch.trang_thai;

-- 3) Ket qua cac bai thi da nop
SELECT bt.ma_bai_thi, tk.ho_ten, bt.diem, bt.trang_thai
FROM bai_thi bt JOIN tai_khoan tk ON tk.ma_nguoi_dung = bt.ma_sinh_vien
ORDER BY bt.diem DESC;

-- 4) Sinh vien khong du dieu kien du thi
SELECT svl.ma_lop_hp, tk.ho_ten, tk.trang_thai
FROM sinh_vien_lop_hp svl JOIN tai_khoan tk ON tk.ma_nguoi_dung = svl.ma_sinh_vien
WHERE svl.du_dieu_kien_thi = 0;
GO