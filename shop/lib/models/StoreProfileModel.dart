class StoreProfileModel {
  final storeName;
  final storeDetails;
  final numbersOfUsers;
  final image;
final  userId;
  final workActivity;
  final currency;

  StoreProfileModel(this.userId,
      {this.storeName,
      this.storeDetails,
      this.numbersOfUsers,
      this.image,
      this.workActivity,
      this.currency});
}
