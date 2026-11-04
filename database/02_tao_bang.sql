/* =====================================================================
   02_tao_bang.sql
   Tao cac bang, khoa chinh, khoa ngoai va rang buoc cho he thong
   thi trac nghiem truc tuyen va quan ly ngan hang cau hoi.
   Chay sau 01_tao_csdl.sql. Chay lai nhieu lan duoc (xoa bang cu truoc),
   LUU Y: chay lai se xoa het du lieu -> phai chay lai 03_du_lieu_mau.sql.
   ===================================================================== */
USE ThiTracNghiem;
GO

/* ---------- 1. XOA BANG CU (bang con truoc, bang cha sau) ---------- */
DROP TABLE IF EXISTS nhat_ky;
DROP TABLE IF EXISTS su_co_thi;
DROP TABLE IF EXISTS bai_thi_chi_tiet;
DROP TABLE IF EXISTS bai_thi;
DROP TABLE IF EXISTS de_thi_cau_hoi;
DROP TABLE IF EXISTS de_thi;
DROP TABLE IF EXISTS ca_thi;
DROP TABLE IF EXISTS ky_thi;
DROP TABLE IF EXISTS ma_tran_chi_tiet;
DROP TABLE IF EXISTS ma_tran_de;
DROP TABLE IF EXISTS lich_su_cau_hoi;
DROP TABLE IF EXISTS tham_dinh_cau_hoi;
DROP TABLE IF EXISTS dap_an;
DROP TABLE IF EXISTS cau_hoi;
DROP TABLE IF EXISTS loai_cau_hoi;
DROP TABLE IF EXISTS muc_do;
DROP TABLE IF EXISTS chu_de;
DROP TABLE IF EXISTS sinh_vien_lop_hp;
DROP TABLE IF EXISTS lop_hoc_phan;
DROP TABLE IF EXISTS hoc_ky;
DROP TABLE IF EXISTS mon_hoc;
DROP TABLE IF EXISTS bo_mon;
DROP TABLE IF EXISTS tai_khoan_vai_tro;
DROP TABLE IF EXISTS tai_khoan;
DROP TABLE IF EXISTS vai_tro;
GO

/* ---------- 2. NHOM QUAN TRI HE THONG (FR-01 -> FR-06) ---------- */
CREATE TABLE vai_tro (
    ma_vai_tro  VARCHAR(30)   NOT NULL CONSTRAINT PK_vai_tro PRIMARY KEY,
    ten_vai_tro NVARCHAR(100) NOT NULL CONSTRAINT UQ_vai_tro_ten UNIQUE,
    mo_ta       NVARCHAR(255) NULL
);

CREATE TABLE tai_khoan (
    ma_nguoi_dung        VARCHAR(20)   NOT NULL CONSTRAINT PK_tai_khoan PRIMARY KEY,
    ho_ten               NVARCHAR(100) NOT NULL,
    email                VARCHAR(100)  NOT NULL CONSTRAINT UQ_tai_khoan_email UNIQUE,
    mat_khau_bam         VARCHAR(255)  NOT NULL,          -- chi luu mat khau da bam, khong luu mat khau goc
    trang_thai           VARCHAR(20)   NOT NULL CONSTRAINT DF_tai_khoan_trang_thai DEFAULT 'HOAT_DONG',
    so_lan_dang_nhap_sai INT           NOT NULL CONSTRAINT DF_tai_khoan_so_lan_sai DEFAULT 0,
    ngay_tao             DATETIME2     NOT NULL CONSTRAINT DF_tai_khoan_ngay_tao DEFAULT SYSDATETIME(),
    CONSTRAINT CK_tai_khoan_trang_thai CHECK (trang_thai IN ('HOAT_DONG','BI_KHOA','VO_HIEU_HOA')),
    CONSTRAINT CK_tai_khoan_so_lan_sai CHECK (so_lan_dang_nhap_sai >= 0)
);

CREATE TABLE tai_khoan_vai_tro (
    ma_nguoi_dung VARCHAR(20) NOT NULL,
    ma_vai_tro    VARCHAR(30) NOT NULL,
    CONSTRAINT PK_tai_khoan_vai_tro PRIMARY KEY (ma_nguoi_dung, ma_vai_tro),
    CONSTRAINT FK_tkvt_tai_khoan FOREIGN KEY (ma_nguoi_dung) REFERENCES tai_khoan(ma_nguoi_dung),
    CONSTRAINT FK_tkvt_vai_tro   FOREIGN KEY (ma_vai_tro)    REFERENCES vai_tro(ma_vai_tro)
);

CREATE TABLE nhat_ky (                                   -- NFR-04: ghi nhat ky thao tac
    ma_nhat_ky    BIGINT IDENTITY(1,1) CONSTRAINT PK_nhat_ky PRIMARY KEY,
    ma_nguoi_dung VARCHAR(20)   NULL,                    -- NULL khi dang nhap that bai
    hanh_dong     VARCHAR(50)   NOT NULL,
    doi_tuong     VARCHAR(50)   NULL,
    chi_tiet      NVARCHAR(500) NULL,
    thoi_diem     DATETIME2     NOT NULL CONSTRAINT DF_nhat_ky_thoi_diem DEFAULT SYSDATETIME(),
    CONSTRAINT FK_nhat_ky_tai_khoan FOREIGN KEY (ma_nguoi_dung) REFERENCES tai_khoan(ma_nguoi_dung)
);

/* ---------- 3. DANH MUC DUNG CHUNG (FR-04) ---------- */
CREATE TABLE bo_mon (
    ma_bo_mon  VARCHAR(20)   NOT NULL CONSTRAINT PK_bo_mon PRIMARY KEY,
    ten_bo_mon NVARCHAR(150) NOT NULL,
    ten_khoa   NVARCHAR(150) NOT NULL
);

CREATE TABLE mon_hoc (
    ma_mon_hoc  VARCHAR(20)   NOT NULL CONSTRAINT PK_mon_hoc PRIMARY KEY,
    ten_mon_hoc NVARCHAR(150) NOT NULL,
    ma_bo_mon   VARCHAR(20)   NOT NULL,
    CONSTRAINT FK_mon_hoc_bo_mon FOREIGN KEY (ma_bo_mon) REFERENCES bo_mon(ma_bo_mon)
);

CREATE TABLE hoc_ky (
    ma_hoc_ky     VARCHAR(20)   NOT NULL CONSTRAINT PK_hoc_ky PRIMARY KEY,
    ten_hoc_ky    NVARCHAR(100) NOT NULL,
    ngay_bat_dau  DATE          NOT NULL,
    ngay_ket_thuc DATE          NOT NULL,
    CONSTRAINT CK_hoc_ky_ngay CHECK (ngay_ket_thuc > ngay_bat_dau)
);

CREATE TABLE lop_hoc_phan (                              -- du lieu do Phong Dao tao cung cap/dong bo
    ma_lop_hp     VARCHAR(20)   NOT NULL CONSTRAINT PK_lop_hoc_phan PRIMARY KEY,
    ma_mon_hoc    VARCHAR(20)   NOT NULL,
    ma_hoc_ky     VARCHAR(20)   NOT NULL,
    ten_lop       NVARCHAR(100) NOT NULL,
    ma_giang_vien VARCHAR(20)   NOT NULL,
    CONSTRAINT FK_lhp_mon_hoc    FOREIGN KEY (ma_mon_hoc)    REFERENCES mon_hoc(ma_mon_hoc),
    CONSTRAINT FK_lhp_hoc_ky     FOREIGN KEY (ma_hoc_ky)     REFERENCES hoc_ky(ma_hoc_ky),
    CONSTRAINT FK_lhp_giang_vien FOREIGN KEY (ma_giang_vien) REFERENCES tai_khoan(ma_nguoi_dung)
);

CREATE TABLE sinh_vien_lop_hp (                          -- dieu kien du thi do Phong Dao tao cung cap (FR-16)
    ma_lop_hp        VARCHAR(20) NOT NULL,
    ma_sinh_vien     VARCHAR(20) NOT NULL,
    du_dieu_kien_thi BIT         NOT NULL CONSTRAINT DF_svlhp_du_dieu_kien DEFAULT 1,
    CONSTRAINT PK_sinh_vien_lop_hp PRIMARY KEY (ma_lop_hp, ma_sinh_vien),
    CONSTRAINT FK_svlhp_lop_hp    FOREIGN KEY (ma_lop_hp)    REFERENCES lop_hoc_phan(ma_lop_hp),
    CONSTRAINT FK_svlhp_sinh_vien FOREIGN KEY (ma_sinh_vien) REFERENCES tai_khoan(ma_nguoi_dung)
);

CREATE TABLE chu_de (
    ma_chu_de  VARCHAR(20)   NOT NULL CONSTRAINT PK_chu_de PRIMARY KEY,
    ma_mon_hoc VARCHAR(20)   NOT NULL,
    ten_chu_de NVARCHAR(150) NOT NULL,
    CONSTRAINT UQ_chu_de_mon_ten UNIQUE (ma_mon_hoc, ten_chu_de),
    CONSTRAINT FK_chu_de_mon_hoc FOREIGN KEY (ma_mon_hoc) REFERENCES mon_hoc(ma_mon_hoc)
);

CREATE TABLE muc_do (                                    -- danh muc co dinh 3 gia tri (NH-05)
    ma_muc_do   VARCHAR(20)  NOT NULL CONSTRAINT PK_muc_do PRIMARY KEY,
    ten_muc_do  NVARCHAR(50) NOT NULL,
    nhan_do_kho NVARCHAR(20) NOT NULL,
    CONSTRAINT CK_muc_do_ma CHECK (ma_muc_do IN ('NHAN_BIET','THONG_HIEU','VAN_DUNG'))
);

CREATE TABLE loai_cau_hoi (
    ma_loai  VARCHAR(20)   NOT NULL CONSTRAINT PK_loai_cau_hoi PRIMARY KEY,
    ten_loai NVARCHAR(100) NOT NULL,
    CONSTRAINT CK_loai_cau_hoi_ma CHECK (ma_loai IN ('MOT_DAP_AN','NHIEU_DAP_AN'))
);

/* ---------- 4. NGAN HANG CAU HOI (FR-07 -> FR-13) ---------- */
CREATE TABLE cau_hoi (
    ma_cau_hoi   VARCHAR(20)   NOT NULL CONSTRAINT PK_cau_hoi PRIMARY KEY,
    ma_chu_de    VARCHAR(20)   NOT NULL,
    ma_loai      VARCHAR(20)   NOT NULL,
    ma_muc_do    VARCHAR(20)   NOT NULL,
    noi_dung     NVARCHAR(MAX) NOT NULL,
    trang_thai   VARCHAR(20)   NOT NULL CONSTRAINT DF_cau_hoi_trang_thai DEFAULT 'NHAP',
    ma_nguoi_tao VARCHAR(20)   NOT NULL,
    ngay_tao     DATETIME2     NOT NULL CONSTRAINT DF_cau_hoi_ngay_tao DEFAULT SYSDATETIME(),
    CONSTRAINT CK_cau_hoi_trang_thai CHECK (trang_thai IN ('NHAP','CHO_THAM_DINH','DA_PHE_DUYET','TRA_CHINH_SUA','NGUNG_SU_DUNG')),
    CONSTRAINT FK_cau_hoi_chu_de   FOREIGN KEY (ma_chu_de)    REFERENCES chu_de(ma_chu_de),
    CONSTRAINT FK_cau_hoi_loai     FOREIGN KEY (ma_loai)      REFERENCES loai_cau_hoi(ma_loai),
    CONSTRAINT FK_cau_hoi_muc_do   FOREIGN KEY (ma_muc_do)    REFERENCES muc_do(ma_muc_do),
    CONSTRAINT FK_cau_hoi_nguoi_tao FOREIGN KEY (ma_nguoi_tao) REFERENCES tai_khoan(ma_nguoi_dung)
);

CREATE TABLE dap_an (
    ma_cau_hoi VARCHAR(20)   NOT NULL,
    ky_hieu    CHAR(1)       NOT NULL,                   -- A, B, C, D, E
    noi_dung   NVARCHAR(500) NOT NULL,
    la_dung    BIT           NOT NULL CONSTRAINT DF_dap_an_la_dung DEFAULT 0,
    CONSTRAINT PK_dap_an PRIMARY KEY (ma_cau_hoi, ky_hieu),
    CONSTRAINT CK_dap_an_ky_hieu CHECK (ky_hieu IN ('A','B','C','D','E')),
    CONSTRAINT FK_dap_an_cau_hoi FOREIGN KEY (ma_cau_hoi) REFERENCES cau_hoi(ma_cau_hoi) ON DELETE CASCADE
);

CREATE TABLE tham_dinh_cau_hoi (                         -- FR-10, FR-11
    ma_tham_dinh       INT IDENTITY(1,1) CONSTRAINT PK_tham_dinh_cau_hoi PRIMARY KEY,
    ma_cau_hoi         VARCHAR(20)   NOT NULL,
    ma_nguoi_tham_dinh VARCHAR(20)   NOT NULL,
    ket_qua            VARCHAR(10)   NOT NULL,
    nhan_xet           NVARCHAR(500) NULL,
    thoi_diem          DATETIME2     NOT NULL CONSTRAINT DF_tham_dinh_thoi_diem DEFAULT SYSDATETIME(),
    CONSTRAINT CK_tham_dinh_ket_qua CHECK (ket_qua IN ('DUYET','TRA_LAI')),
    CONSTRAINT FK_tham_dinh_cau_hoi FOREIGN KEY (ma_cau_hoi)         REFERENCES cau_hoi(ma_cau_hoi),
    CONSTRAINT FK_tham_dinh_nguoi   FOREIGN KEY (ma_nguoi_tham_dinh) REFERENCES tai_khoan(ma_nguoi_dung)
);

CREATE TABLE lich_su_cau_hoi (                           -- FR-13: lich su thay doi
    ma_lich_su   INT IDENTITY(1,1) CONSTRAINT PK_lich_su_cau_hoi PRIMARY KEY,
    ma_cau_hoi   VARCHAR(20)   NOT NULL,
    ma_nguoi_sua VARCHAR(20)   NOT NULL,
    noi_dung_cu  NVARCHAR(MAX) NOT NULL,
    ghi_chu      NVARCHAR(255) NULL,
    thoi_diem    DATETIME2     NOT NULL CONSTRAINT DF_lich_su_thoi_diem DEFAULT SYSDATETIME(),
    CONSTRAINT FK_lich_su_cau_hoi FOREIGN KEY (ma_cau_hoi)   REFERENCES cau_hoi(ma_cau_hoi),
    CONSTRAINT FK_lich_su_nguoi   FOREIGN KEY (ma_nguoi_sua) REFERENCES tai_khoan(ma_nguoi_dung)
);

/* ---------- 5. MA TRAN DE VA DE THI (FR-14, FR-15) ---------- */
CREATE TABLE ma_tran_de (
    ma_tran         VARCHAR(20)   NOT NULL CONSTRAINT PK_ma_tran_de PRIMARY KEY,
    ten_ma_tran     NVARCHAR(200) NOT NULL,
    ma_mon_hoc      VARCHAR(20)   NOT NULL,
    trang_thai      VARCHAR(20)   NOT NULL CONSTRAINT DF_ma_tran_trang_thai DEFAULT 'NHAP',
    ma_nguoi_lap    VARCHAR(20)   NOT NULL,              -- Can bo khao thi lap
    ma_nguoi_duyet  VARCHAR(20)   NULL,                  -- Truong bo mon/Hoi dong chuyen mon duyet
    ngay_lap        DATETIME2     NOT NULL CONSTRAINT DF_ma_tran_ngay_lap DEFAULT SYSDATETIME(),
    ngay_duyet      DATETIME2     NULL,
    CONSTRAINT CK_ma_tran_trang_thai CHECK (trang_thai IN ('NHAP','CHO_DUYET','DA_DUYET','TRA_CHINH_SUA')),
    CONSTRAINT CK_ma_tran_nguoi_duyet CHECK (trang_thai <> 'DA_DUYET' OR ma_nguoi_duyet IS NOT NULL),
    CONSTRAINT CK_ma_tran_ngay_duyet CHECK (ngay_duyet IS NULL OR ngay_duyet >= ngay_lap),
    CONSTRAINT FK_ma_tran_mon_hoc FOREIGN KEY (ma_mon_hoc)     REFERENCES mon_hoc(ma_mon_hoc),
    CONSTRAINT FK_ma_tran_nguoi_lap FOREIGN KEY (ma_nguoi_lap)   REFERENCES tai_khoan(ma_nguoi_dung),
    CONSTRAINT FK_ma_tran_nguoi_duyet FOREIGN KEY (ma_nguoi_duyet) REFERENCES tai_khoan(ma_nguoi_dung)
);

CREATE TABLE ma_tran_chi_tiet (
    ma_tran   VARCHAR(20) NOT NULL,
    ma_chu_de VARCHAR(20) NOT NULL,
    ma_muc_do VARCHAR(20) NOT NULL,
    so_cau    INT         NOT NULL,
    CONSTRAINT PK_ma_tran_chi_tiet PRIMARY KEY (ma_tran, ma_chu_de, ma_muc_do),
    CONSTRAINT CK_ma_tran_chi_tiet_so_cau CHECK (so_cau > 0),
    CONSTRAINT FK_mtct_ma_tran FOREIGN KEY (ma_tran)   REFERENCES ma_tran_de(ma_tran) ON DELETE CASCADE,
    CONSTRAINT FK_mtct_chu_de  FOREIGN KEY (ma_chu_de) REFERENCES chu_de(ma_chu_de),
    CONSTRAINT FK_mtct_muc_do  FOREIGN KEY (ma_muc_do) REFERENCES muc_do(ma_muc_do)
);

/* ---------- 6. KY THI, CA THI (FR-16 -> FR-20) ---------- */
CREATE TABLE ky_thi (
    ma_ky_thi  VARCHAR(20)   NOT NULL CONSTRAINT PK_ky_thi PRIMARY KEY,
    ten_ky_thi NVARCHAR(150) NOT NULL,
    ma_hoc_ky  VARCHAR(20)   NOT NULL,
    CONSTRAINT FK_ky_thi_hoc_ky FOREIGN KEY (ma_hoc_ky) REFERENCES hoc_ky(ma_hoc_ky)
);

CREATE TABLE ca_thi (
    ma_ca_thi           VARCHAR(20) NOT NULL CONSTRAINT PK_ca_thi PRIMARY KEY,
    ma_ky_thi           VARCHAR(20) NOT NULL,
    ma_lop_hp           VARCHAR(20) NOT NULL,
    ma_tran             VARCHAR(20) NOT NULL,            -- chi nen dung ma tran da duyet (kiem soat o ung dung)
    ma_can_bo_khao_thi  VARCHAR(20) NOT NULL,
    thoi_gian_bat_dau   DATETIME2   NOT NULL,
    thoi_luong_phut     INT         NOT NULL,
    trang_thai          VARCHAR(20) NOT NULL CONSTRAINT DF_ca_thi_trang_thai DEFAULT 'CHUA_BAT_DAU',
    CONSTRAINT CK_ca_thi_thoi_luong CHECK (thoi_luong_phut > 0),
    CONSTRAINT CK_ca_thi_trang_thai CHECK (trang_thai IN ('CHUA_BAT_DAU','DANG_DIEN_RA','KET_THUC','HUY')),
    CONSTRAINT FK_ca_thi_ky_thi  FOREIGN KEY (ma_ky_thi)          REFERENCES ky_thi(ma_ky_thi),
    CONSTRAINT FK_ca_thi_lop_hp  FOREIGN KEY (ma_lop_hp)          REFERENCES lop_hoc_phan(ma_lop_hp),
    CONSTRAINT FK_ca_thi_ma_tran FOREIGN KEY (ma_tran)            REFERENCES ma_tran_de(ma_tran),
    CONSTRAINT FK_ca_thi_can_bo  FOREIGN KEY (ma_can_bo_khao_thi) REFERENCES tai_khoan(ma_nguoi_dung)
);

CREATE TABLE de_thi (
    ma_de_thi     VARCHAR(20) NOT NULL CONSTRAINT PK_de_thi PRIMARY KEY,
    ma_ca_thi     VARCHAR(20) NOT NULL,
    trang_thai    VARCHAR(20) NOT NULL CONSTRAINT DF_de_thi_trang_thai DEFAULT 'DA_SINH',
    ma_nguoi_chot VARCHAR(20) NULL,                      -- Can bo khao thi xem lai va chot de
    ngay_sinh     DATETIME2   NOT NULL CONSTRAINT DF_de_thi_ngay_sinh DEFAULT SYSDATETIME(),
    CONSTRAINT CK_de_thi_trang_thai CHECK (trang_thai IN ('DA_SINH','DA_CHOT')),
    CONSTRAINT CK_de_thi_nguoi_chot CHECK (trang_thai <> 'DA_CHOT' OR ma_nguoi_chot IS NOT NULL),
    CONSTRAINT FK_de_thi_ca_thi     FOREIGN KEY (ma_ca_thi)     REFERENCES ca_thi(ma_ca_thi),
    CONSTRAINT FK_de_thi_nguoi_chot FOREIGN KEY (ma_nguoi_chot) REFERENCES tai_khoan(ma_nguoi_dung)
);

CREATE TABLE de_thi_cau_hoi (
    ma_de_thi  VARCHAR(20) NOT NULL,
    ma_cau_hoi VARCHAR(20) NOT NULL,
    thu_tu     INT         NOT NULL,
    CONSTRAINT PK_de_thi_cau_hoi PRIMARY KEY (ma_de_thi, ma_cau_hoi),
    CONSTRAINT UQ_de_thi_cau_hoi_thu_tu UNIQUE (ma_de_thi, thu_tu),
    CONSTRAINT CK_de_thi_cau_hoi_thu_tu CHECK (thu_tu > 0),
    CONSTRAINT FK_dtch_de_thi  FOREIGN KEY (ma_de_thi)  REFERENCES de_thi(ma_de_thi) ON DELETE CASCADE,
    CONSTRAINT FK_dtch_cau_hoi FOREIGN KEY (ma_cau_hoi) REFERENCES cau_hoi(ma_cau_hoi)
);

/* ---------- 7. THI TRUC TUYEN (FR-21 -> FR-26) ---------- */
CREATE TABLE bai_thi (
    ma_bai_thi        VARCHAR(30)  NOT NULL CONSTRAINT PK_bai_thi PRIMARY KEY,
    ma_ca_thi         VARCHAR(20)  NOT NULL,
    ma_de_thi         VARCHAR(20)  NOT NULL,
    ma_sinh_vien      VARCHAR(20)  NOT NULL,
    thoi_diem_bat_dau DATETIME2    NOT NULL,
    thoi_diem_nop     DATETIME2    NULL,
    trang_thai        VARCHAR(20)  NOT NULL CONSTRAINT DF_bai_thi_trang_thai DEFAULT 'DANG_LAM',
    diem              DECIMAL(4,2) NULL,
    CONSTRAINT UQ_bai_thi_ca_sinh_vien UNIQUE (ma_ca_thi, ma_sinh_vien),   -- moi tai khoan mot phien thi (NFR-03)
    CONSTRAINT CK_bai_thi_trang_thai CHECK (trang_thai IN ('DANG_LAM','DA_NOP','HET_GIO','HUY')),
    CONSTRAINT CK_bai_thi_diem CHECK (diem IS NULL OR (diem >= 0 AND diem <= 10)),
    CONSTRAINT CK_bai_thi_thoi_gian CHECK (thoi_diem_nop IS NULL OR thoi_diem_nop >= thoi_diem_bat_dau),
    CONSTRAINT FK_bai_thi_ca_thi     FOREIGN KEY (ma_ca_thi)    REFERENCES ca_thi(ma_ca_thi),
    CONSTRAINT FK_bai_thi_de_thi     FOREIGN KEY (ma_de_thi)    REFERENCES de_thi(ma_de_thi),
    CONSTRAINT FK_bai_thi_sinh_vien  FOREIGN KEY (ma_sinh_vien) REFERENCES tai_khoan(ma_nguoi_dung)
);

CREATE TABLE bai_thi_chi_tiet (                          -- dap an sinh vien da chon (cau nhieu dap an: nhieu dong)
    ma_bai_thi   VARCHAR(30) NOT NULL,
    ma_cau_hoi   VARCHAR(20) NOT NULL,
    ky_hieu_chon CHAR(1)     NOT NULL,
    CONSTRAINT PK_bai_thi_chi_tiet PRIMARY KEY (ma_bai_thi, ma_cau_hoi, ky_hieu_chon),
    CONSTRAINT FK_btct_bai_thi FOREIGN KEY (ma_bai_thi) REFERENCES bai_thi(ma_bai_thi) ON DELETE CASCADE,
    CONSTRAINT FK_btct_dap_an  FOREIGN KEY (ma_cau_hoi, ky_hieu_chon) REFERENCES dap_an(ma_cau_hoi, ky_hieu)
);

CREATE TABLE su_co_thi (                                 -- FR-19
    ma_su_co      INT IDENTITY(1,1) CONSTRAINT PK_su_co_thi PRIMARY KEY,
    ma_ca_thi     VARCHAR(20)   NOT NULL,
    ma_bai_thi    VARCHAR(30)   NULL,
    loai_su_co    VARCHAR(20)   NOT NULL,
    mo_ta         NVARCHAR(500) NOT NULL,
    ma_nguoi_ghi  VARCHAR(20)   NOT NULL,
    cach_xu_ly    NVARCHAR(500) NULL,
    trang_thai    VARCHAR(20)   NOT NULL CONSTRAINT DF_su_co_trang_thai DEFAULT 'MOI',
    thoi_diem     DATETIME2     NOT NULL CONSTRAINT DF_su_co_thoi_diem DEFAULT SYSDATETIME(),
    CONSTRAINT CK_su_co_loai CHECK (loai_su_co IN ('MAT_KET_NOI','LOI_HE_THONG','DANG_NHAP_TRUNG','KHAC')),
    CONSTRAINT CK_su_co_trang_thai CHECK (trang_thai IN ('MOI','DA_XU_LY')),
    CONSTRAINT FK_su_co_ca_thi  FOREIGN KEY (ma_ca_thi)    REFERENCES ca_thi(ma_ca_thi),
    CONSTRAINT FK_su_co_bai_thi FOREIGN KEY (ma_bai_thi)   REFERENCES bai_thi(ma_bai_thi),
    CONSTRAINT FK_su_co_nguoi   FOREIGN KEY (ma_nguoi_ghi) REFERENCES tai_khoan(ma_nguoi_dung)
);
GO