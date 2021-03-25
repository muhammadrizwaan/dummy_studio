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
const String getHistoryApi = "$apiBaseUrl/api/Loads/MyLoadHistory?userId={userId}&pageIndex=";
const String getGoodTypeApi = "$apiBaseUrl/api/GoodTypes";
const String getVehicleTypeApi = "$apiBaseUrl/api/Vehicle/GetVehicleTypes";
const String deleteLoadApi = "$apiBaseUrl/api/Loads/DeleteLoad?loadId={loadId}";
const String getLoadCostApi = "$apiBaseUrl/api/Loads/GetLoadCostsByLoadId?loadId={loadId}&userId={userId}";
const String getShipperDiscountApi = "$apiBaseUrl/api/Loads/GetShipperIndividualDiscount?userId={userId}";
const String estimatedLoadPriceApi = "$apiBaseUrl/api/Loads/EstimatedLoadPrice";
const String getUpdateUserInformationApi = "$apiBaseUrl/api/Accounts/UpdateUserInformation";

const String getLoadsApi = "$apiBaseUrl/api/Loads/GetShipperLoads?userId={userId}";
const String saveLoadApi = "$apiBaseUrl/api/Loads/SaveLoad";
const String getLoadDetailApi = "$apiBaseUrl/api/Loads/GetLoadDetailsByLoadId?loadId={loadId}&userId={userId}";
const String getDriverDetailApi = "$apiBaseUrl/api//Users/GetDriverDetails?driverId={driverId}";
const String getInvoiceDetailApi = "$apiBaseUrl/api/Transactions/GetInvoiceDetails?transactionId={Id}";
const String uploadProfilePictureApi = "$apiBaseUrl/api/Accounts/UploadProfilePicture";
const String cancellLoadApi = "$apiBaseUrl/api/Loads/RejectedByShipper";
const String getVehicleByVehicleId = "$apiBaseUrl/api/Vehicle/GetVehicleCategoriesByVehicleTypeId?id={vehicleId}";
const String getWalletApi = "$apiBaseUrl/api/Wallet/GetShipperWallet?userId={userId}";
const String getDriversApi = "$apiBaseUrl/api/Loads/GetLoadDriversDetailsLoadId?loadId={loadId}&userId={userId}";
// Load status Apis
const String getPlacedLoadApi = "$apiBaseUrl/api/Loads/GetMyPlacedLoadsShipper?userId={userId}&pageIndex=";
const String getAcceptedLoadApi = "$apiBaseUrl/api/Loads/GetMyAcceptedLoadsShipper?userId={userId}&pageIndex=";
const String getInProcessLoadApi = "$apiBaseUrl/api/Loads/GetMyInProcessLoadsShipper?userId={userId}&pageIndex=";
const String getDeliveredLoadApi = "$apiBaseUrl/api/Loads/GetDeliveredLoads?userId={userId}&pageIndex=";
const String getCancelledLoadApi = "$apiBaseUrl/api/Loads/GetMyCancelledLoadsShipper?userId={userId}&pageIndex=";
const String getLoadCountsApi = "$apiBaseUrl/api/Loads/GetLoadCounts?userId={userId}";
const String getApplyCouponApi = "$apiBaseUrl/api/ApplyPromoCode?promoCode={CouponCode}&loadId={loadId}";
const String acceptedByShipperApi = "$apiBaseUrl/api/Loads/AcceptedByShipper";

const String uploadLoadImages = "$apiBaseUrl/api/Loads/UploadLoadImages";
// const String uploadLicenseImages = "$apiBaseUrl/api/Accounts/UploadUserLicenses";
const String uploadLicenseImages = "$apiBaseUrl/api/Accounts/UploadBusinessLicense";
const String getTermsApi = "$apiBaseUrl/api/Terms";
const String saveRatingApi = "$apiBaseUrl/api/Rating/SaveRating";


const String termsAndConditionLink = "http://truckoom.jinnbytedev.com/";
const String getInvoiceDownloadApi = "$apiBaseUrl/api/Transactions/DownloadInvoice?loadId=";

