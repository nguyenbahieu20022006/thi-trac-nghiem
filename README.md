\# Hệ thống thi trắc nghiệm trực tuyến và quản lý ngân hàng câu hỏi



Dự án môn Phân tích thiết kế hệ thống. Giai đoạn hiện tại gồm khung dự án và cơ sở dữ liệu SQL Server; phần ứng dụng chưa triển khai.



\## Thành viên và phân công



| STT | Họ tên | MSSV | Phân công |

|-----|--------|------|-----------|

| 1 | Nguyễn Bá Hiếu | 20246046855 | IT |

| 2 | Lê Vũ Dũng | 2024604686 | IT |

| 3 | Nguyễn Văn Đoàn | 2024604687 | IT |



\## Công cụ và phiên bản



| Công cụ | Phiên bản |

|---------|-----------|

| Git | <số phiên bản> |

| SQL Server | Express 17.0 |

| SQL Server Management Studio (SSMS) | <số phiên bản> |



\## Cấu trúc thư mục



\- `database/`: script SQL (tạo CSDL, tạo bảng, dữ liệu mẫu, kiểm tra ràng buộc)

\- `docs/erd/`: sơ đồ ERD tuần 3

\- `docs/bao-cao/`: báo cáo và sơ đồ



\## Hướng dẫn dựng cơ sở dữ liệu



1\. Clone kho: `git clone https://github.com/nguyenbahieu20022006/thi-trac-nghiem.git`

2\. Mở SSMS và kết nối SQL Server (Windows Authentication, tick Trust server certificate nếu có).

3\. Mở lần lượt các file trong thư mục `database/` và bấm Execute theo thứ tự `01`, `02`, `03`. File `01` chạy khi đang chọn CSDL `master`; các file sau chạy trên CSDL `ThiTracNghiem`.

4\. Kiểm tra: trong Object Explorer, chuột phải Databases, chọn Refresh, phải thấy CSDL `ThiTracNghiem`.



\## Quy ước làm việc với Git



\- Không sửa trực tiếp trên nhánh `main`; mỗi việc tạo một nhánh riêng (ví dụ `feature/tao-bang`).

\- Làm xong thì push nhánh và tạo Pull Request để một bạn xem trước khi gộp.

\- Trước khi bắt đầu làm việc, chạy `git pull`.

\- Thay đổi cấu trúc CSDL phải sửa trong file script rồi commit, không sửa tay trên máy riêng.

