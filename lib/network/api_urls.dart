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
const String getHistoryApi = "$baseUrl/api/Loads/MyLoadHistory?userId={userId}";
const String getGoodTypeApi = "$baseUrl/api/GoodTypes";
const String getVehicleTypeApi = "$baseUrl/api/Vehicle/GetVehicleTypes";
const String deleteLoadApi = "$baseUrl/api/Loads/DeleteLoad?loadId={loadId}";
const String estimatedLoadPriceApi = "$baseUrl/api/Loads/EstimatedLoadPrice";
const String getUpdateUserInformationApi = "$baseUrl/api/Accounts/UpdateUserInformation";
// pending
const String saveLoadApi = "$baseUrl/api/Loads/SaveLoad";
const String getLoadDetailApi = "$baseUrl/api/Loads/GetLoadDetailsByLoadId?loadId={loadId}";
const String getDriverDetailApi = "$baseUrl/api//Users/GetDriverDetails?driverId={driverId}";
const String getInvoiceDetailApi = "$baseUrl/api/Transactions/GetInvoiceDetails?transactionId={Id}";
const String uploadProfilePictureApi = "$baseUrl/api/Accounts/UploadProfilePicture";
const String cancellLoadApi = "$baseUrl/api/Loads/RejectedByShipper";


