import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/continue_watching_item.dart';

part 'continue_watching_dto.g.dart';

@JsonSerializable()
class ContinueWatchingDto {
  final String? id;
  final String? title;
  final String? institute;
  final num? progress;
  final num? rating;
  final String? image;
  final String? imageUrl;

  ContinueWatchingDto({
    this.id,
    this.title,
    this.institute,
    this.progress,
    this.rating,
    this.image,
    this.imageUrl,
  });

  factory ContinueWatchingDto.fromJson(Map<String, dynamic> json) =>
      _$ContinueWatchingDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ContinueWatchingDtoToJson(this);

  ContinueWatchingItem toEntity() => ContinueWatchingItem(
        id: id ?? '',
        title: title ?? '',
        institute: institute ?? '',
        progress: (progress == null)
            ? 0
            : (progress! > 1 ? (progress!.toDouble() / 100.0) : progress!.toDouble()),
        rating: (rating ?? 0).toDouble(),
        imageUrl: (image ?? imageUrl ?? ''),
      );
}
