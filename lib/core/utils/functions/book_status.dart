import 'package:dev_zone/features/home/data/models/book_model/item.dart';

String getBookStatus({required Item? book}) {
  if (book?.volumeInfo?.previewLink != null) {
    return 'Preview';
  }
  return 'Not Available';
}
