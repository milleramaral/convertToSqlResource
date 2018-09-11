object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Convert TClientDataSet to TSqlResource'
  ClientHeight = 659
  ClientWidth = 873
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
  object Splitter1: TSplitter
    Left = 489
    Top = 57
    Height = 420
    ExplicitLeft = 248
    ExplicitTop = 73
    ExplicitHeight = 602
  end
  object Splitter2: TSplitter
    Left = 0
    Top = 477
    Width = 873
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitLeft = 489
    ExplicitTop = 57
    ExplicitWidth = 423
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 873
    Height = 57
    Align = alTop
    TabOrder = 0
    DesignSize = (
      873
      57)
    object edtDfmFilesPath: TLabeledEdit
      Left = 16
      Top = 24
      Width = 337
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      EditLabel.Width = 68
      EditLabel.Height = 13
      EditLabel.Caption = 'DFM files path'
      TabOrder = 0
    end
    object btnLoad: TButton
      Left = 360
      Top = 24
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Load'
      TabOrder = 1
      OnClick = btnLoadClick
    end
    object edtSqlFilesPath: TLabeledEdit
      Left = 440
      Top = 24
      Width = 337
      Height = 21
      Anchors = [akTop, akRight]
      EditLabel.Width = 66
      EditLabel.Height = 13
      EditLabel.Caption = 'SQL files path'
      TabOrder = 2
    end
    object btnCreate: TButton
      Left = 784
      Top = 24
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Convert'
      TabOrder = 3
      OnClick = btnCreateClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 489
    Height = 420
    Align = alLeft
    Padding.Left = 8
    Padding.Top = 8
    Padding.Right = 8
    Padding.Bottom = 8
    TabOrder = 1
    object lblTitleDfmFiles: TLabel
      AlignWithMargins = True
      Left = 9
      Top = 9
      Width = 471
      Height = 13
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 8
      Align = alTop
      Alignment = taCenter
      Caption = 'dfm files founded (0)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 117
    end
    object mmoDfmFiles: TMemo
      Left = 9
      Top = 30
      Width = 471
      Height = 381
      Align = alClient
      ScrollBars = ssBoth
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 492
    Top = 57
    Width = 381
    Height = 420
    Align = alClient
    Padding.Left = 8
    Padding.Top = 8
    Padding.Right = 8
    Padding.Bottom = 8
    TabOrder = 2
    object lblSqlFiles: TLabel
      AlignWithMargins = True
      Left = 9
      Top = 9
      Width = 363
      Height = 13
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 8
      Align = alTop
      Alignment = taCenter
      Caption = 'Sql files created (0)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 110
    end
    object mmoSqlFiles: TMemo
      Left = 9
      Top = 30
      Width = 363
      Height = 381
      Align = alClient
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 0
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 480
    Width = 873
    Height = 179
    Align = alBottom
    Padding.Left = 8
    Padding.Top = 8
    Padding.Right = 8
    Padding.Bottom = 8
    TabOrder = 3
    object lblErrors: TLabel
      AlignWithMargins = True
      Left = 9
      Top = 9
      Width = 855
      Height = 13
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 8
      Align = alTop
      Alignment = taCenter
      Caption = 'Dfm files with errors (0)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 134
    end
    object mmoErrors: TMemo
      Left = 9
      Top = 30
      Width = 855
      Height = 140
      Align = alClient
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 0
    end
  end
end
