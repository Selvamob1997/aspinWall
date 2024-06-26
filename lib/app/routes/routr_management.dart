
import 'package:aspinwal/app/routes/app_pages.dart';
import 'package:get/get.dart';

abstract class RouteManageMent{

  static void goToLogin(){
    Get.offNamed(Routes.LOGIN_PAGES);
  }
  static void goToFormerDash(){
    Get.offNamed(Routes.DASH_BOARD);
  }
  static void goToReportDash(){
    Get.toNamed(Routes.REPORTING_DASH_BORD);
  }

  static void goToSiteVisit(){
    Get.toNamed(Routes.SITE_VISIT);
  }

  static void goToAttendance(){
    Get.toNamed(Routes.ATTENDANCE_PAGE);
  }
  static void goToLeadPage(docno,companyNme){
    Get.toNamed(
        Routes.LEAD_PAGED,
        arguments: {
          "DocNo":docno,
          "CompanyName":companyNme
        }
    );
  }
  static void goToLeadReports(){
    Get.toNamed(Routes.LEAD_REPORTS);
  }
  static void goToProdEnquery(){
    Get.toNamed(Routes.PRODUCTION_ENTRY);
  }
  static void goToReportsPage(){
    Get.toNamed(Routes.REPORTS_PAGES);
  }

  static void goToSalesQuationReports(){
    Get.toNamed(Routes.SALES_QUATION_REPORTS);
  }
  static void goToLeaveMaster(){
    Get.toNamed(Routes.LEAVE_MASTER);
  }
  static void goToPermisionMaster(){
    Get.toNamed(Routes.PERMISION_MASTER);
  }

  static void goToOndutyMaters(){
    Get.toNamed(Routes.ONDUTY_MASTER);
  }

  static void goToReimbursMaters(){
    Get.toNamed(Routes.REIMBURSEMENT_MASTER);
  }

  static void goToProductionHeader(){
    Get.toNamed(Routes.PRODUCTION_ENTRY_HEADER);
  }
  static void goToMenuDashContr(){
    Get.offNamed(Routes.MENU_DASH);
  }
  static void goToHolyDay(){
    Get.toNamed(Routes.HOLI_DAY_LIST);
  }
  static void goToSalesEntry(){
    Get.toNamed(Routes.SALES_ENQUERY);
  }
  static void goToProfile(){
    Get.toNamed(Routes.MY_PROFILE_PAGE);
  }
  static void goToSiteViteReports(){
    Get.toNamed(Routes.SITE_VISIT_REPORTS);
  }
  static void goToAttendanceReports(){
    Get.toNamed(Routes.ATTENDANCE_REPORTS);
  }
  static void goToClientReports(){
    Get.toNamed(Routes.CLIENTVISIT_REPORTS);
  }
  static void goToLeaveReports(){
    Get.toNamed(Routes.LEAVEMASTER_REPORTS);
  }
  static void goToPermisionReports(){
    Get.toNamed(Routes.PERMISION_REPORTS);
  }
  static void goToOndutyReports(){
    Get.toNamed(Routes.ONDUTY_REPORTS);
  }

  static void goToLeaveApproval(){
    Get.toNamed(Routes.LEAVEMATER_APPROVAL);
  }

  static void goToPermisionApproval(){
    Get.toNamed(Routes.PERMISION_APPROVE);
  }

  static void goToOndutyApproval(){
    Get.toNamed(Routes.ONDUTY_APPROVE);
  }

  static void goToTelecalling(docNo){
    Get.toNamed(Routes.TELECALLING,
    arguments: {"DocNo":docNo}
    );
  }
  static void goToTelecallingReports(){
    Get.toNamed(Routes.TELECALLING_REPORTS);
  }

  static void goToActity(){
    Get.toNamed(Routes.MY_ACTITY);
  }

  static void goToEnquery(status,cardcode,cardname,docNo){
    Get.toNamed(Routes.ENQUERY_SCREEN,arguments: {
      'Status':status,
      'CardCode':cardcode,
      'CardName':cardname,
      'DocNo':docNo
    });
  }

  static void goToDashBoard(reportType,empId,cardCode,itemType,year,mn){
    Get.toNamed(Routes.DASH_BOARD_REPORTS,arguments: {
      'reportType':reportType,
      'empId':empId,
      'cardCode':cardCode,
      'itemType':itemType,
      'year': year,
      'mn':mn,
    });
  }

  static void goToNotifi(){
    Get.toNamed(Routes.NOTIFICATION_PANEL);
  }




}