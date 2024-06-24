// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:image_picker/image_picker.dart';

// part 'picker_photo_event.dart';
// part 'picker_photo_state.dart';

// class PickerPhotoBloc extends Bloc<PickerPhotoEvent, PickerPhotoState> {
//   PickerPhotoBloc() : super(const PickerPhotoState()) {
//     on<OnSelectImageEvent>((_onSelectImage));
//     on<OnUnSelectImageEvent>((_onUnSelectImage));
//   }
//   Future<void> _onSelectImage(
//       OnSelectImageEvent event, Emitter<PickerPhotoState> emit) async {
//     emit(state.copywith(images: event.images));
//   }

//   Future<void> _onUnSelectImage(
//       OnUnSelectImageEvent event, Emitter<PickerPhotoState> emit) async {
//     emit(state.copywith(images: null));
//   }
// }
