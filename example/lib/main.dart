import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:sunmi_print_library/sunmi_printer.dart';
import 'package:sunmi_printerx/sunmi_printerx.dart';

void main() {
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Application",
        home: HomePrinterView()),
  );
}

class HomePrinterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  await SunmiPrinterX.cut();
                },
                child: const Text("Test Cut Lib 3"),
              ),
            ),
            SizedBox(height: 32,),
            Center(
              child: ElevatedButton(
                // in table
                onPressed: () async {
                  await SunmiPrinter.bindPrinterService();
                  await SunmiPrinter.initPrinter();
                  await SunmiPrinter.startTransactionPrint();
                  await SunmiPrinter.printTable(size: 21, cols: [
                    ColumnMaker(text: 'Name', width: 10, align: 0),
                    ColumnMaker(text: 'Qty', width: 6, align: 1),
                    ColumnMaker(text: 'UN', width: 10, align: 2),
                    ColumnMaker(text: 'TOT', width: 10, align: 2),
                  ]);
                  await SunmiPrinter.printTable(cols: [
                    ColumnMaker(text: 'Fries', width: 10, align: 0),
                    ColumnMaker(text: '4x', width: 6, align: 1),
                    ColumnMaker(text: '3.00', width: 10, align: 2),
                    ColumnMaker(text: '12.00', width: 10, align: 2),
                  ]);
                  await SunmiPrinter.printTable(size: 20, cols: [
                    ColumnMaker(text: 'Sản phẩm Ahq', width: 20, align: 0),
                    // ColumnMaker(text: '4x', width: 6, align: 1),
                    ColumnMaker(text: '120.00000', width: 10, align: 2),
                  ]);
                  //await SunmiPrinter.initPrinterExam();
                  await SunmiPrinter.lineWrap(3);
                  await SunmiPrinter.feedPaper();
                  final result = await SunmiPrinter.exitTransactionPrint();
                  print("Result print: " + result);
                  await SunmiPrinter.unbindPrinterService();
                },
                child: const Text("Test Cut lib 2"),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  await SunmiPrinter.bindPrinterService();
                  await SunmiPrinter.initPrinter();
                  await SunmiPrinter.startTransactionPrint();
                  await SunmiPrinter.printTable(size: 21, cols: [
                    ColumnMaker(text: 'Name', width: 10, align: 0),
                    ColumnMaker(text: 'Qty', width: 6, align: 1),
                    ColumnMaker(text: 'UN', width: 10, align: 2),
                    ColumnMaker(text: 'TOT', width: 10, align: 2),
                  ]);
                  await SunmiPrinter.printTable(cols: [
                    ColumnMaker(text: 'Fries', width: 10, align: 0),
                    ColumnMaker(text: '4x', width: 6, align: 1),
                    ColumnMaker(text: '3.00', width: 10, align: 2),
                    ColumnMaker(text: '12.00', width: 10, align: 2),
                  ]);
                  await SunmiPrinter.printTable(size: 20, cols: [
                    ColumnMaker(text: 'Sản phẩm Ahq', width: 20, align: 0),
                    // ColumnMaker(text: '4x', width: 6, align: 1),
                    ColumnMaker(text: '120.00000', width: 10, align: 2),
                  ]);
                  final result = await SunmiPrinter.exitTransactionPrint();
                  print("Result print: " + result);
                  await SunmiPrinterX.cut();
                  await SunmiPrinter.unbindPrinterService();
                },
                child: const Text("Test Cut lib 2 + lib 3"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Uint8List> _getImageFromAsset(String iconPath) async {
    return await readFileBytes(iconPath);
  }

  Future<Uint8List> readFileBytes(String path) async {
    ByteData fileData = await rootBundle.load(path);
    Uint8List fileUnit8List = fileData.buffer
        .asUint8List(fileData.offsetInBytes, fileData.lengthInBytes);
    return fileUnit8List;
  }
}

class AppConst {
  static const String nameCompany = "CÔNG TY TNHH GIẢI PHÁP ĐÔ THỊ NAM HẢI";
  static const String addressConpany = "Số 33 Ngõ 151 Láng Hạ, Đống Đa, Hà Nội";
  static const String nameTicket = "VÉ TRÔNG GIỮ XE Ô TÔ";
  static const String fareTicket = "Giá vé: ";
  static const String ticketStartingDateHP = "Giờ xe vào:";
  static const String day = "ngày";
  static const String month = "tháng";
  static const String year = "năm";
  static const String ncc = "NCC";
  static const String nameTaxCode = "MST";
  static const String taxCode = "0105987432";
  static const String nameCompanyNCC = "Softdreams";
  static const String custommerService = "CSKH";
  static const String moneyTicket = "25,000";
  static const String phoneCustomerService = "19003369";
  static const String taxCodeName = "Mã số thuế:";
  static const String taxCodeCustomer = "12589654";

  static const String nameCompany2 = "CÔNG TY CPTVXDMT VÀ VT THÀNH AN";
  static const String addressConpany2 =
      "Thôn 7, X.Thọ Lộc, H.Thọ Xuân, Thanh Hoá";
  static const String nameTicket2 = "VÉ XE KHÁCH";
  static const String moneyTicket2 = "90,000";
  static const String ticketStartingDate = "Thời gian xuất  bến: ";
  static const String location = "Bắc Ninh - Thanh Hoá";
}

const String PATTERN_1 = "dd/MM/yyyy";
const String PATTERN_DD = "dd";
const String PATTERN_MM = "MM";
const String PATTERN_YY = "yyyy";
const String PATTERN_2 = "dd/MM";
const String PATTERN_3 = "yyyy-MM-dd'T'HHmmss";
const String PATTERN_4 = "h:mm a dd/MM";
const String PATTERN_5 = "yyyy-MM-dd HH:mm:ss";
const String PATTERN_6 = "dd/MM/yyyy HH:mm";
const String PATTERN_7 = "HH:mm dd/MM/yyyy";
const String PATTERN_8 = "yyyy-MM-ddTHH:mm:ss";
const String PATTERN_9 = "HH:mm - dd/MM/yyyy";
const String PATTERN_10 = "dd/MM/yyyy HH:mm:ss";
const String PATTERN_11 = "HH:mm";
const String PATTERN_DEFAULT = "yyyy-MM-dd";

String convertDateToString(DateTime dateTime, String pattern) {
  return DateFormat(pattern).format(dateTime);
}
