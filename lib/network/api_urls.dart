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

const String saveLoadApi = "$baseUrl/api/Loads/SaveLoad";
const String getLoadDetailApi = "$baseUrl/api/Loads/GetLoadDetailsByLoadId?loadId={loadId}";
const String getDriverDetailApi = "$baseUrl/api//Users/GetDriverDetails?driverId={driverId}";
const String getInvoiceDetailApi = "$baseUrl/api/Transactions/GetInvoiceDetails?transactionId={Id}";
const String uploadProfilePictureApi = "$baseUrl/api/Accounts/UploadProfilePicture";
const String cancellLoadApi = "$baseUrl/api/Loads/RejectedByShipper";
const String getVehicleByVehicleId = "$baseUrl/api/Vehicle/GetVehicleCategoriesByVehicleTypeId?id={vehicleId}";

// Load status Apis
const String getPlacedLoadApi = "$baseUrl/api/Loads/GetMyPlacedLoadsShipper?userId={userId}";
const String getAcceptedLoadApi = "$baseUrl/api/Loads/GetMyAcceptedLoadsShipper?userId={userId}";
const String getInProcessLoadApi = "$baseUrl/api/Loads/GetMyInProcessLoadsShipper?userId={userId}";
const String getDeliveredLoadApi = "$baseUrl/api/Loads/GetDeliveredLoads?userId={userId}";
const String getCancelledLoadApi = "$baseUrl/api/Loads/GetMyCancelledLoadsShipper?userId={userId}";
const String getApplyCouponApi = "$baseUrl/api/ApplyPromoCode?promoCode={CouponCode}&loadId={loadId}";
const String acceptedByShipperApi = "$baseUrl/api/Loads/AcceptedByShipper";

const String uploadLoadImages = "$baseUrl/api/Loads/UploadLoadImages";
const String uploadLicenseImages = "$baseUrl/api/Accounts/UploadUserLicenses";
