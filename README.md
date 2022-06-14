# ChubbLife IFRS17 Data Integration

## 專案目錄

TBD

## Data Stage ERD

TBD

## ETL

TBD

## 本機開發環境

在本機上開發必須要有 `Microsoft SQL Server Data Tools`，請先安裝相關環境

1. 請按照說明文件安裝 [Integration Services (SSIS)](https://docs.microsoft.com/zh-tw/sql/integration-services/install-windows/install-integration-services?view=sql-server-ver15)
2. 安裝 [Microsoft SQL Server Data Tools](https://docs.microsoft.com/zh-tw/sql/ssdt/download-sql-server-data-tools-ssdt?view=sql-server-ver15)
3. 根據 [範例](https://docs.microsoft.com/zh-tw/sql/integration-services/lesson-1-create-a-project-and-basic-package-with-ssis?view=sql-server-ver15)
先練習使用方式

### Optional: 使用 Docker 建立 Microsoft SQL Server with SSIS 環境

請先確認本機已安裝 [docker](https://docs.docker.com/get-docker) ，

透過以下指令啟動 Microsoft SQL Server

```shell
 sh run-docker.sh
 
 Microsoft SQL Server with SSIS 啟動成功
          容器名稱: mssql
          登入帳號: sa
          登入密碼: P@ssw0rd
          連線埠號: 1433
          JDBC 連線方式: jdbc:sqlserver://localhost:1433
```

相關指令說明請透過 `-h` 查看

```shell
sh run-docker.sh -h

啟動本機 Microsoft SQL Server with SSIS

  參數:
    -h  指令說明
    -l  開啟日誌
    -n  設定容器名稱
    -p  對應本地埠號
```

## SoftLeader 測試環境

TBD

## ChubbLife SIT 測試環境

TBD

## ChubbLife UAT 測試環境

TBD

## ChubbLife 正式環境

TBD

## 新手上路

1. 安裝 [SQL Server 2019](https://www.microsoft.com/zh-tw/sql-server/sql-server-downloads?rtc=1)
2. 在 SQL Server 2019 安裝過程中將 [SSIS](https://docs.microsoft.com/zh-tw/sql/integration-services/install-windows/install-integration-services?view=sql-server-ver15) 安裝起來
3. 安裝 [Visual Studio 2019](https://visualstudio.microsoft.com/downloads/)
4. 在安 Visual Studio 2019 的過程中將 [SSDT](https://docs.microsoft.com/zh-tw/sql/ssdt/download-sql-server-data-tools-ssdt?view=sql-server-ver15) 安裝起來
5. 下載 [範例資料庫](https://docs.microsoft.com/zh-tw/sql/samples/adventureworks-install-configure?view=sql-server-ver15&tabs=ssms) ，並匯入到 SQL Server 裡
6. 照著教學完成 [第一課](https://docs.microsoft.com/zh-tw/sql/integration-services/lesson-1-create-a-project-and-basic-package-with-ssis?view=sql-server-ver15) 的練習
7. 完成其他的 [教學課程](https://docs.microsoft.com/zh-tw/sql/integration-services/integration-services-tutorials?view=sql-server-ver15)

## 其他參考資料

相關文件資料路徑 **svn://svn.softleader.com.tw/svnroot/naomi/Temp/IFRS17/系統案/ETL-chubblife安達人壽ETL建置**


## 功能反饋與改進

反饋問題或需求，請透過下列方式提供
- [Softleader Mantis](https://service.softleader.com.tw/slmantis)
- [Github Issues](https://github.com/softleader/chubblife-ifrs17/issues)

新功能需求提交，請透過下列方式提供
- [Github Pull Requests](https://github.com/softleader/chubblife-ifrs17/pulls)

或隨時與開發人員討論
- [Softleader Slack](https://softleader.slack.com)