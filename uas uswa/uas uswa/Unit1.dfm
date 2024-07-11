object Form1: TForm1
  Left = 251
  Top = 158
  Width = 870
  Height = 570
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 64
    Top = 40
    Width = 17
    Height = 13
    Caption = 'NIK'
  end
  object lbl2: TLabel
    Left = 64
    Top = 72
    Width = 29
    Height = 13
    Caption = 'NAMA'
  end
  object lbl3: TLabel
    Left = 64
    Top = 104
    Width = 23
    Height = 13
    Caption = 'TELP'
  end
  object lbl4: TLabel
    Left = 64
    Top = 136
    Width = 30
    Height = 13
    Caption = 'EMAIL'
  end
  object lbl5: TLabel
    Left = 64
    Top = 168
    Width = 40
    Height = 13
    Caption = 'ALAMAT'
  end
  object lbl6: TLabel
    Left = 64
    Top = 200
    Width = 41
    Height = 13
    Caption = 'MEMBER'
  end
  object lbl7: TLabel
    Left = 304
    Top = 200
    Width = 51
    Height = 13
    Caption = 'DISKON   :'
  end
  object lbl8: TLabel
    Left = 376
    Top = 200
    Width = 89
    Height = 13
    Caption = 'TERISI OTOMATIS'
  end
  object lbl9: TLabel
    Left = 64
    Top = 496
    Width = 79
    Height = 13
    Caption = 'MASUKAN NAME'
  end
  object edt1: TEdit
    Left = 136
    Top = 32
    Width = 273
    Height = 21
    TabOrder = 0
  end
  object edt2: TEdit
    Left = 136
    Top = 64
    Width = 273
    Height = 21
    TabOrder = 1
  end
  object edt3: TEdit
    Left = 136
    Top = 96
    Width = 273
    Height = 21
    TabOrder = 2
  end
  object edt4: TEdit
    Left = 136
    Top = 128
    Width = 273
    Height = 21
    TabOrder = 3
  end
  object edt5: TEdit
    Left = 136
    Top = 160
    Width = 273
    Height = 21
    TabOrder = 4
  end
  object cbb1: TComboBox
    Left = 136
    Top = 200
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 5
  end
  object btn1: TButton
    Left = 136
    Top = 248
    Width = 75
    Height = 25
    Caption = 'BARU'
    TabOrder = 6
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 232
    Top = 248
    Width = 75
    Height = 25
    Caption = 'SIMPAN'
    TabOrder = 7
    OnClick = btn2Click
  end
  object btn3: TButton
    Left = 328
    Top = 248
    Width = 75
    Height = 25
    Caption = 'EDIT'
    TabOrder = 8
    OnClick = btn3Click
  end
  object btn4: TButton
    Left = 424
    Top = 248
    Width = 75
    Height = 25
    Caption = 'HAPUS'
    TabOrder = 9
    OnClick = btn4Click
  end
  object btn5: TButton
    Left = 520
    Top = 248
    Width = 75
    Height = 25
    Caption = 'BATAL'
    TabOrder = 10
    OnClick = btn5Click
  end
  object edt6: TEdit
    Left = 168
    Top = 496
    Width = 249
    Height = 21
    TabOrder = 11
  end
  object btn6: TButton
    Left = 440
    Top = 496
    Width = 75
    Height = 25
    Caption = 'CARI'
    TabOrder = 12
    OnClick = btn6Click
  end
  object btn7: TButton
    Left = 512
    Top = 104
    Width = 75
    Height = 25
    Caption = 'CETAK'
    TabOrder = 13
    OnClick = btn7Click
  end
  object dbgrd1: TDBGrid
    Left = 176
    Top = 320
    Width = 320
    Height = 120
    DataSource = DataModule2.ds1
    TabOrder = 14
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = dbgrd1CellClick
  end
end
