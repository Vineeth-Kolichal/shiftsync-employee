import 'dart:io';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:shiftsync/data/models/salary_details_model/salary_details_model.dart';
import 'package:shiftsync/data/pdf/pdf_api.dart';

class PdfSalarySlipApi {
  static Future<File> generate(SalaryDetailsModel salaryDetailsModel) async {
    final image = await imageFromAssetBundle('assets/images/shiftsync.png');

    final pdf = Document();

    pdf.addPage(MultiPage(
      build: (context) => [
        pw.Image(image, height: PdfPageFormat.cm * 2.5),
        SizedBox(
            width: double.infinity,
            child: Center(
                child: Text("Salary Slip",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)))),
        SizedBox(height: 0.5 * PdfPageFormat.cm),
        pw.Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Sl No:'),
          pw.Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text(DateFormat.yMd().format(DateTime.now())),
            Text('Kochi')
          ])
        ]),
        SizedBox(height: PdfPageFormat.cm),
        pw.Row(children: [
          Text('Name:'),
          Text('Vineeth Chandran',
              style: TextStyle(fontWeight: FontWeight.bold))
        ]),
        pw.Row(children: [
          Text('Designation:'),
          Text('Flutter Developer',
              style: TextStyle(fontWeight: FontWeight.bold))
        ]),
        SizedBox(height: PdfPageFormat.cm),
        Text('Pay Details', style: TextStyle(fontWeight: FontWeight.bold)),
        Divider(),
        payDetailsWidget(
            title: 'Grade',
            value: salaryDetailsModel.salaryDetails?.grade ?? 'Grade',
            color: const PdfColor(0.01, 0.6, 0.99)),
        payDetailsWidget(
          title: 'Pay type',
          value: 'Salary',
        ),
        payDetailsWidget(
          title: 'Pay Freequency',
          value: 'Monthly',
        ),
        payDetailsWidget(
          title: 'Base Salary',
          value: salaryDetailsModel.salaryDetails?.basesalary.toString() ?? '',
        ),
        payDetailsWidget(
          title: 'Dearness Allowance',
          value: salaryDetailsModel.salaryDetails?.dallowance.toString() ?? '',
        ),
        payDetailsWidget(
          title: 'Special Allowance',
          value: salaryDetailsModel.salaryDetails?.spallowance.toString() ?? '',
        ),
        payDetailsWidget(
          title: 'Medical Allowance',
          value: salaryDetailsModel.salaryDetails?.mallowance.toString() ?? '',
        ),
        payDetailsWidget(
          title: 'Over time benafits',
          value: salaryDetailsModel.salaryDetails?.overtime.toString() ?? '',
        ),
        payDetailsWidget(
            textStyle: TextStyle(fontWeight: FontWeight.bold),
            title: 'Gross Salary',
            value:
                salaryDetailsModel.salaryDetails?.grosssalary.toString() ?? '',
            color: const PdfColor(0.5, 0.7, 0.5)),
        Divider(color: const PdfColor(0.8, 0.8, 0.8)),
        payDetailsWidget(
          title: 'Professional Tax',
          value: '-${salaryDetailsModel.salaryDetails?.tax}',
          color: const PdfColor(1, 0.1, 0.1),
        ),
        payDetailsWidget(
          title: 'Providend Fund',
          value: '-${salaryDetailsModel.salaryDetails?.provident}',
          color: const PdfColor(1, 0.1, 0.1),
        ),
        Divider(color: const PdfColor(0.8, 0.8, 0.8)),
        payDetailsWidget(
            textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            title: 'Net Salary',
            value: 'RS ${salaryDetailsModel.salaryDetails?.netsalary}/-',
            valueFontSize: 16,
            color: const PdfColor(0.5, 0.7, 0.5)),
        Divider(),
        SizedBox(height: 1.5 * PdfPageFormat.cm),
        pw.Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          pw.Column(children: [
            pw.Text('Administrator'),
            pw.Text('Sd/-'),
          ]),
        ])
      ],
    ));

    return PdfApi.saveDocument(name: 'salary_slip.pdf', pdf: pdf);
  }
}

Widget payDetailsWidget(
    {required String title,
    required String value,
    PdfColor color = const PdfColor(0, 0, 0),
    double? valueFontSize,
    TextStyle? textStyle}) {
  return pw.Padding(
      padding: const EdgeInsets.all(5),
      child:
          pw.Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(title, style: textStyle),
        Text(value,
            style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: valueFontSize))
      ]));
}
