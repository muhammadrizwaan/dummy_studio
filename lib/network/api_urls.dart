//Base URL
const String baseUrl = "http://apitruckoom.jinnbytedev.com";


const String loginApi = "$baseUrl/api/Accounts/Login";
const String tokenApi = "$baseUrl/token";
const String phoneNumberApi = "$baseUrl/api/Accounts/SendOTP?number=";
const String individualSignUp = "$baseUrl/api/Accounts/RegisterShipper";
const String businessSignUpStep1 = "$baseUrl/api/Accounts/RegisterShipperBusinessBasic";
const String businessSignUpStep2 = "$baseUrl/api/Accounts/RegisterShipperBusiness";
const String citiesApi = "$baseUrl/api/Cities";
const String forgotPassword = "$baseUrl/api/Accounts/ForgotPassword?email=";

const String saveQuery = "$baseUrl/api/Queries/SaveQuery";

const String getLoadApi = "$baseUrl/api/Loads/MyLoads?userId={userId}&statusId={statusId}";
// const String getLoadApi = "$baseUrl/api/Loads/MyLoads?userId=2059&statusId=1";


