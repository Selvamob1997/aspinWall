import '../../app/modules/splash_screen_module/splash_screen_bindings.dart';
import '../../app/modules/splash_screen_module/splash_screen_page.dart';
import 'package:get/get.dart';
import '../modules/attendance_page_module/attendance_page_bindings.dart';
import '../modules/attendance_page_module/attendance_page_page.dart';
import '../modules/attendance_reports_module/attendance_reports_bindings.dart';
import '../modules/attendance_reports_module/attendance_reports_page.dart';
import '../modules/clientvisit_reports_module/clientvisit_reports_bindings.dart';
import '../modules/clientvisit_reports_module/clientvisit_reports_page.dart';
import '../modules/dash_board_module/dash_board_bindings.dart';
import '../modules/dash_board_module/dash_board_page.dart';
import '../modules/dash_board_reports_module/dash_board_reports_bindings.dart';
import '../modules/dash_board_reports_module/dash_board_reports_page.dart';
import '../modules/enquery_screen_module/enquery_screen_bindings.dart';
import '../modules/enquery_screen_module/enquery_screen_page.dart';
import '../modules/holi_day_list_module/holi_day_list_bindings.dart';
import '../modules/holi_day_list_module/holi_day_list_page.dart';
import '../modules/lead_paged_module/lead_paged_bindings.dart';
import '../modules/lead_paged_module/lead_paged_page.dart';
import '../modules/lead_reports_module/lead_reports_bindings.dart';
import '../modules/lead_reports_module/lead_reports_page.dart';
import '../modules/leave_master_module/leave_master_bindings.dart';
import '../modules/leave_master_module/leave_master_page.dart';
import '../modules/leavemaster_reports_module/leavemaster_reports_bindings.dart';
import '../modules/leavemaster_reports_module/leavemaster_reports_page.dart';
import '../modules/leavemater_approval_module/leavemater_approval_bindings.dart';
import '../modules/leavemater_approval_module/leavemater_approval_page.dart';
import '../modules/login_pages_module/login_pages_bindings.dart';
import '../modules/login_pages_module/login_pages_page.dart';
import '../modules/menu_dash_module/menu_dash_bindings.dart';
import '../modules/menu_dash_module/menu_dash_page.dart';
import '../modules/my_actity_module/my_actity_bindings.dart';
import '../modules/my_actity_module/my_actity_page.dart';
import '../modules/my_profile_page_module/my_profile_page_bindings.dart';
import '../modules/my_profile_page_module/my_profile_page_page.dart';
import '../modules/notification_panel_module/notification_panel_bindings.dart';
import '../modules/notification_panel_module/notification_panel_page.dart';
import '../modules/onduty_approve_module/onduty_approve_bindings.dart';
import '../modules/onduty_approve_module/onduty_approve_page.dart';
import '../modules/onduty_master_module/onduty_master_bindings.dart';
import '../modules/onduty_master_module/onduty_master_page.dart';
import '../modules/onduty_reports_module/onduty_reports_bindings.dart';
import '../modules/onduty_reports_module/onduty_reports_page.dart';
import '../modules/permision_approve_module/permision_approve_bindings.dart';
import '../modules/permision_approve_module/permision_approve_page.dart';
import '../modules/permision_master_module/permision_master_bindings.dart';
import '../modules/permision_master_module/permision_master_page.dart';
import '../modules/permision_reports_module/permision_reports_bindings.dart';
import '../modules/permision_reports_module/permision_reports_page.dart';
import '../modules/production_entry_header_module/production_entry_header_bindings.dart';
import '../modules/production_entry_header_module/production_entry_header_page.dart';
import '../modules/production_entry_module/production_entry_bindings.dart';
import '../modules/production_entry_module/production_entry_page.dart';
import '../modules/reimbursement_master_module/reimbursement_master_bindings.dart';
import '../modules/reimbursement_master_module/reimbursement_master_page.dart';
import '../modules/reporting_dash_bord_module/reporting_dash_bord_bindings.dart';
import '../modules/reporting_dash_bord_module/reporting_dash_bord_page.dart';
import '../modules/reports_pages_module/reports_pages_bindings.dart';
import '../modules/reports_pages_module/reports_pages_page.dart';
import '../modules/sales_enquery_module/sales_enquery_bindings.dart';
import '../modules/sales_enquery_module/sales_enquery_page.dart';
import '../modules/sales_quation_reports_module/sales_quation_reports_bindings.dart';
import '../modules/sales_quation_reports_module/sales_quation_reports_page.dart';
import '../modules/site_visit_module/site_visit_bindings.dart';
import '../modules/site_visit_module/site_visit_page.dart';
import '../modules/site_visit_reports_module/site_visit_reports_bindings.dart';
import '../modules/site_visit_reports_module/site_visit_reports_page.dart';
import '../modules/telecalling_module/telecalling_bindings.dart';
import '../modules/telecalling_module/telecalling_page.dart';
import '../modules/telecalling_reports_module/telecalling_reports_bindings.dart';
import '../modules/telecalling_reports_module/telecalling_reports_page.dart';
part './app_routes.dart';
/**
 * GetX Generator - fb.com/htngu.99
 * */

abstract class AppPages {
  static var initialpage = Routes.SPLASH_SCREEN;
  static final pages = [
    GetPage(
      name: Routes.SPLASH_SCREEN,
      page: () => SplashScreenPage(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: Routes.LOGIN_PAGES,
      page: () => LoginPagesPage(),
      binding: LoginPagesBinding(),
    ),
    GetPage(
      name: Routes.DASH_BOARD,
      page: () => DashBoardPage(),
      binding: DashBoardBinding(),
    ),
    GetPage(
      name: Routes.SITE_VISIT,
      page: () => SiteVisitPage(),
      binding: SiteVisitBinding(),
    ),
    GetPage(
      name: Routes.ATTENDANCE_PAGE,
      page: () => AttendancePagePage(),
      binding: AttendancePageBinding(),
    ),
    GetPage(
      name: Routes.LEAD_PAGED,
      page: () => LeadPagedPage(),
      binding: LeadPagedBinding(),
    ),
    GetPage(
      name: Routes.LEAD_REPORTS,
      page: () => LeadReportsPage(),
      binding: LeadReportsBinding(),
    ),
    GetPage(
      name: Routes.PRODUCTION_ENTRY,
      page: () => ProductionEntryPage(),
      binding: ProductionEntryBinding(),
    ),
    GetPage(
      name: Routes.REPORTING_DASH_BORD,
      page: () => ReportingDashBordPage(),
      binding: ReportingDashBordBinding(),
    ),
    GetPage(
      name: Routes.REPORTS_PAGES,
      page: () => ReportsPagesPage(),
      binding: ReportsPagesBinding(),
    ),
    GetPage(
      name: Routes.SALES_QUATION_REPORTS,
      page: () => SalesQuationReportsPage(),
      binding: SalesQuationReportsBinding(),
    ),
    GetPage(
      name: Routes.LEAVE_MASTER,
      page: () => LeaveMasterPage(),
      binding: LeaveMasterBinding(),
    ),
    GetPage(
      name: Routes.PERMISION_MASTER,
      page: () => PermisionMasterPage(),
      binding: PermisionMasterBinding(),
    ),
    GetPage(
      name: Routes.ONDUTY_MASTER,
      page: () => OndutyMasterPage(),
      binding: OndutyMasterBinding(),
    ),
    GetPage(
      name: Routes.REIMBURSEMENT_MASTER,
      page: () => ReimbursementMasterPage(),
      binding: ReimbursementMasterBinding(),
    ),
    GetPage(
      name: Routes.PRODUCTION_ENTRY_HEADER,
      page: () => ProductionEntryHeaderPage(),
      binding: ProductionEntryHeaderBinding(),
    ),
    GetPage(
      name: Routes.MENU_DASH,
      page: () => MenuDashPage(),
      binding: MenuDashBinding(),
    ),
    GetPage(
      name: Routes.HOLI_DAY_LIST,
      page: () => HoliDayListPage(),
      binding: HoliDayListBinding(),
    ),
    GetPage(
      name: Routes.SALES_ENQUERY,
      page: () => SalesEnqueryPage(),
      binding: SalesEnqueryBinding(),
    ),
    GetPage(
      name: Routes.MY_PROFILE_PAGE,
      page: () => MyProfilePagePage(),
      binding: MyProfilePageBinding(),
    ),
    GetPage(
      name: Routes.SITE_VISIT_REPORTS,
      page: () => SiteVisitReportsPage(),
      binding: SiteVisitReportsBinding(),
    ),
    GetPage(
      name: Routes.ATTENDANCE_REPORTS,
      page: () => AttendanceReportsPage(),
      binding: AttendanceReportsBinding(),
    ),
    GetPage(
      name: Routes.CLIENTVISIT_REPORTS,
      page: () => ClientvisitReportsPage(),
      binding: ClientvisitReportsBinding(),
    ),
    GetPage(
      name: Routes.LEAVEMASTER_REPORTS,
      page: () => LeavemasterReportsPage(),
      binding: LeavemasterReportsBinding(),
    ),
    GetPage(
      name: Routes.PERMISION_REPORTS,
      page: () => PermisionReportsPage(),
      binding: PermisionReportsBinding(),
    ),
    GetPage(
      name: Routes.ONDUTY_REPORTS,
      page: () => OndutyReportsPage(),
      binding: OndutyReportsBinding(),
    ),
    GetPage(
      name: Routes.LEAVEMATER_APPROVAL,
      page: () => LeavematerApprovalPage(),
      binding: LeavematerApprovalBinding(),
    ),
    GetPage(
      name: Routes.PERMISION_APPROVE,
      page: () => PermisionApprovePage(),
      binding: PermisionApproveBinding(),
    ),
    GetPage(
      name: Routes.ONDUTY_APPROVE,
      page: () => OndutyApprovePage(),
      binding: OndutyApproveBinding(),
    ),
    GetPage(
      name: Routes.TELECALLING,
      page: () => TelecallingPage(),
      binding: TelecallingBinding(),
    ),
    GetPage(
      name: Routes.TELECALLING_REPORTS,
      page: () => TelecallingReportsPage(),
      binding: TelecallingReportsBinding(),
    ),
    GetPage(
      name: Routes.MY_ACTITY,
      page: () => MyActityPage(),
      binding: MyActityBinding(),
    ),
    GetPage(
      name: Routes.ENQUERY_SCREEN,
      page: () => EnqueryScreenPage(),
      binding: EnqueryScreenBinding(),
    ),
    GetPage(
      name: Routes.DASH_BOARD_REPORTS,
      page: () => DashBoardReportsPage(),
      binding: DashBoardReportsBinding(),
    ),
    GetPage(
      name: Routes.NOTIFICATION_PANEL,
      page: () => NotificationPanelPage(),
      binding: NotificationPanelBinding(),
    ),
  ];
}