USE ThiTracNghiem;
GO

-- 1. XOA BANG CU (bang con truoc, bang cha sau)
DROP TABLE IF EXISTS dap_an;
DROP TABLE IF EXISTS cau_hoi;
DROP TABLE IF EXISTS chu_de;
DROP TABLE IF EXISTS mon_hoc;
DROP TABLE IF EXISTS tai_khoan_vai_tro;
DROP TABLE IF EXISTS tai_khoan;
DROP TABLE IF EXISTS vai_tro;
GO

-- 2. TAO BANG (bang cha truoc, bang con sau)
CREATE TABLE vai_tro (
    ma_vai_tro  INT IDENTITY(1,1) CONSTRAINT PK_vai_tro PRIMARY KEY,
    ten_vai_tro NVARCHAR(100) NOT NULL CONSTRAINT UQ_vai_tro_ten UNIQUE
);

CREATE TABLE tai_khoan (
    ma_nguoi_dung VARCHAR(20)   NOT NULL CONSTRAINT PK_tai_khoan PRIMARY KEY,
    ho_ten        NVARCHAR(100) NOT NULL,
    email         VARCHAR(100)  NOT NULL CONSTRAINT UQ_tai_khoan_email UNIQUE,
    mat_khau_bam  VARCHAR(255)  NOT NULL,
    trang_thai    VARCHAR(20)   NOT NULL CONSTRAINT DF_tai_khoan_tt DEFAULT 'HOAT_DONG',
    ngay_tao      DATETIME2     NOT NULL CONSTRAINT DF_tai_khoan_ngay DEFAULT SYSDATETIME(),
    CONSTRAINT CK_tai_khoan_tt CHECK (trang_thai IN ('HOAT_DONG','BI_KHOA','VO_HIEU_HOA'))
);

CREATE TABLE tai_khoan_vai_tro (
    ma_nguoi_dung VARCHAR(20) NOT NULL,
    ma_vai_tro    INT         NOT NULL,
    CONSTRAINT PK_tkvt PRIMARY KEY (ma_nguoi_dung, ma_vai_tro),
    CONSTRAINT FK_tkvt_tk FOREIGN KEY (ma_nguoi_dung) REFERENCES tai_khoan(ma_nguoi_dung),
    CONSTRAINT FK_tkvt_vt FOREIGN KEY (ma_vai_tro)    REFERENCES vai_tro(ma_vai_tro)
);

CREATE TABLE mon_hoc (
    ma_mon_hoc  VARCHAR(20)   NOT NULL CONSTRAINT PK_mon_hoc PRIMARY KEY,
    ten_mon_hoc NVARCHAR(150) NOT NULL
);

CREATE TABLE chu_de (
    ma_chu_de  INT IDENTITY(1,1) CONSTRAINT PK_chu_de PRIMARY KEY,
    ma_mon_hoc VARCHAR(20)   NOT NULL,
    ten_chu_de NVARCHAR(150) NOT NULL,
    CONSTRAINT FK_chu_de_mon FOREIGN KEY (ma_mon_hoc) REFERENCES mon_hoc(ma_mon_hoc)
);

CREATE TABLE cau_hoi (
    ma_cau_hoi   INT IDENTITY(1,1) CONSTRAINT PK_cau_hoi PRIMARY KEY,
    ma_chu_de    INT           NOT NULL,
    noi_dung     NVARCHAR(MAX) NOT NULL,
    muc_do       VARCHAR(20)   NOT NULL,
    trang_thai   VARCHAR(20)   NOT NULL CONSTRAINT DF_ch_tt DEFAULT 'NHAP',
    ma_nguoi_tao VARCHAR(20)   NOT NULL,
    CONSTRAINT CK_ch_muc_do CHECK (muc_do IN ('NHAN_BIET','THONG_HIEU','VAN_DUNG')),
    CONSTRAINT CK_ch_tt CHECK (trang_thai IN ('NHAP','CHO_THAM_DINH','DA_PHE_DUYET','TRA_CHINH_SUA')),
    CONSTRAINT FK_ch_cd FOREIGN KEY (ma_chu_de)    REFERENCES chu_de(ma_chu_de),
    CONSTRAINT FK_ch_tk FOREIGN KEY (ma_nguoi_tao) REFERENCES tai_khoan(ma_nguoi_dung)
);

CREATE TABLE dap_an (
    ma_dap_an  INT IDENTITY(1,1) CONSTRAINT PK_dap_an PRIMARY KEY,
    ma_cau_hoi INT           NOT NULL,
    noi_dung   NVARCHAR(500) NOT NULL,
    la_dung    BIT           NOT NULL CONSTRAINT DF_da_dung DEFAULT 0,
    CONSTRAINT FK_da_ch FOREIGN KEY (ma_cau_hoi) REFERENCES cau_hoi(ma_cau_hoi) ON DELETE CASCADE
);
GO