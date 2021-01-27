//Base URL
const String apiBaseUrl = "http://apitruckoom.jinnbytedev.com";
const String baseUrl = "";


const String loginApi = "$apiBaseUrl/api/Accounts/Login";
const String tokenApi = "$apiBaseUrl/token";
const String phoneNumberApi = "$apiBaseUrl/api/Accounts/SendOTP?number=";
const String individualSignUp = "$apiBaseUrl/api/Accounts/RegisterShipper";
const String businessSignUpStep1 = "$apiBaseUrl/api/Accounts/RegisterShipperBusinessBasic";
const String businessSignUpStep2 = "$apiBaseUrl/api/Accounts/RegisterShipperBusiness";
const String citiesApi = "$apiBaseUrl/api/Cities";
const String forgotPassword = "$apiBaseUrl/api/Accounts/ForgotPassword?email=";

const String saveQuery = "$apiBaseUrl/api/Queries/SaveQuery";
const String getLoadApi = "$apiBaseUrl/api/Loads/MyLoads?userId={userId}&statusId={statusId}";
const String getHistoryApi = "$apiBaseUrl/api/Loads/MyLoadHistory?userId={userId}";
const String getGoodTypeApi = "$apiBaseUrl/api/GoodTypes";
const String getVehicleTypeApi = "$apiBaseUrl/api/Vehicle/GetVehicleTypes";
const String deleteLoadApi = "$apiBaseUrl/api/Loads/DeleteLoad?loadId={loadId}";
const String estimatedLoadPriceApi = "$apiBaseUrl/api/Loads/EstimatedLoadPrice";
const String getUpdateUserInformationApi = "$apiBaseUrl/api/Accounts/UpdateUserInformation";

const String saveLoadApi = "$apiBaseUrl/api/Loads/SaveLoad";
const String getLoadDetailApi = "$apiBaseUrl/api/Loads/GetLoadDetailsByLoadId?loadId={loadId}";
const String getDriverDetailApi = "$apiBaseUrl/api//Users/GetDriverDetails?driverId={driverId}";
const String getInvoiceDetailApi = "$apiBaseUrl/api/Transactions/GetInvoiceDetails?transactionId={Id}";
const String uploadProfilePictureApi = "$apiBaseUrl/api/Accounts/UploadProfilePicture";
const String cancellLoadApi = "$apiBaseUrl/api/Loads/RejectedByShipper";
const String getVehicleByVehicleId = "$apiBaseUrl/api/Vehicle/GetVehicleCategoriesByVehicleTypeId?id={vehicleId}";
const String getWalletApi = "$apiBaseUrl/api/Wallet/GetShipperWallet?userId={userId}";

// Load status Apis
const String getPlacedLoadApi = "$apiBaseUrl/api/Loads/GetMyPlacedLoadsShipper?userId={userId}";
const String getAcceptedLoadApi = "$apiBaseUrl/api/Loads/GetMyAcceptedLoadsShipper?userId={userId}";
const String getInProcessLoadApi = "$apiBaseUrl/api/Loads/GetMyInProcessLoadsShipper?userId={userId}";
const String getDeliveredLoadApi = "$apiBaseUrl/api/Loads/GetDeliveredLoads?userId={userId}";
const String getCancelledLoadApi = "$apiBaseUrl/api/Loads/GetMyCancelledLoadsShipper?userId={userId}";
const String getApplyCouponApi = "$apiBaseUrl/api/ApplyPromoCode?promoCode={CouponCode}&loadId={loadId}";
const String acceptedByShipperApi = "$apiBaseUrl/api/Loads/AcceptedByShipper";

const String uploadLoadImages = "$apiBaseUrl/api/Loads/UploadLoadImages";
const String uploadLicenseImages = "$apiBaseUrl/api/Accounts/UploadUserLicenses";
