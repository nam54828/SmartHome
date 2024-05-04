// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smarthome/core/enums/enums.dart';
import 'package:smarthome/core/helper/custom_size_util.dart';
import 'package:smarthome/core/helper/custom_validate.dart';
import 'package:smarthome/core/utils/color_resources.dart';
import 'package:smarthome/core/utils/images_path.dart';

// ignore: must_be_immutable
class CustomImage extends StatelessWidget {
  CustomImage(
      String this.urlImage, {
        super.key,
        this.width,
        this.height,
        this.fit = BoxFit.cover,
        this.colorIconsSvg,
      });
  CustomImage.file(
      this.file, {
        super.key,
        this.width,
        this.height,
        this.fit = BoxFit.cover,
      });
  CustomImage.icon(
      IconData this.icon, {
        super.key,
        this.width,
        this.height,
        this.fit = BoxFit.cover,
        this.color = ColorResources.OUTER_SPACE,
        this.size,
      });
  String? urlImage;
  final double? width;
  final double? height;
  final BoxFit? fit;
  File? file;
  IconData? icon;
  Color? color;
  Color? colorIconsSvg;
  double? size;

  CustomImageType checkImageType(String url) {
    if (CustomValidate.nullOrEmpty(url) && CustomValidate.nullOrEmpty(file) && CustomValidate.nullOrEmpty(icon)) {
      return CustomImageType.NOT_IMAGE;
    }
    if (url.endsWith(".svg")) {
      return CustomImageType.SVG;
    }
    return CustomImageType.IMAGE;
  }

  CustomImageUrlType checkImageUrlType(String url) {
    if (CustomValidate.nullOrEmpty(url)) {
      if (icon != null) {
        return CustomImageUrlType.ICON;
      }
      return CustomImageUrlType.FILE;
    }
    if (url.startsWith('http') || url.startsWith('https')) {
      return CustomImageUrlType.NETWORK;
    } else if (url.startsWith('assets/')) {
      return CustomImageUrlType.ASSET;
    } else if (icon != null) {
      if (icon!.fontFamily.toString().toLowerCase().contains('CupertinoIcons'.toLowerCase()) ||
          icon!.fontFamily.toString().toLowerCase().contains('MaterialIcons'.toLowerCase())) {
        return CustomImageUrlType.ICON;
      }
      return CustomImageUrlType.FILE;
    }
    return CustomImageUrlType.FILE;
  }

  Widget imageTypeWidget(String urlImage, CustomImageType imageType, CustomImageUrlType imageUrlType) {
    if (imageType == CustomImageType.IMAGE) {
      if (imageUrlType == CustomImageUrlType.NETWORK) {
        return CachedNetworkImage(
          imageUrl: urlImage,
          fadeOutDuration: Duration.zero,
          fadeInDuration: Duration.zero,
          width: width,
          height: height,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: fit,
              ),
            ),
          ),
          placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => Image.asset(
            ImagesPath.placeHolder,
            fit: fit,
            height: height ?? CustomSizeUtil.setSizeWithWidth(percent: .1),
            width: width ?? CustomSizeUtil.setSizeWithWidth(percent: .1),
          ),
        );
      } else if (imageUrlType == CustomImageUrlType.ASSET) {
        return Image.asset(
          urlImage,
          fit: fit,
          height: height,
          width: width,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              ImagesPath.placeHolder,
              fit: fit,
              height: height ?? CustomSizeUtil.setSizeWithWidth(percent: .1),
              width: width ?? CustomSizeUtil.setSizeWithWidth(percent: .1),
            );
          },
        );
      } else if (imageUrlType == CustomImageUrlType.FILE) {
        return Image.file(
          file!,
          fit: fit,
          height: height,
          width: width,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              ImagesPath.placeHolder,
              fit: fit,
              height: height ?? CustomSizeUtil.setSizeWithWidth(percent: .1),
              width: width ?? CustomSizeUtil.setSizeWithWidth(percent: .1),
            );
          },
        );
      } else if (imageUrlType == CustomImageUrlType.ICON) {
        return SizedBox(
          height: height,
          width: width,
          child: Icon(
            icon,
            color: color,
            size: size ?? CustomSizeUtil.setSize(percent: .08),
          ),
        );
      }
    }

    if (imageType == CustomImageType.SVG) {
      if (imageUrlType == CustomImageUrlType.NETWORK) {
        return SvgPicture.network(
          urlImage,
          fit: fit!,
          height: height,
          width: width,
          placeholderBuilder: (BuildContext context) => const SizedBox(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      } else if (imageUrlType == CustomImageUrlType.ASSET) {
        return SvgPicture.asset(
          urlImage,
          fit: fit!,
          height: height,
          width: width,
          color: colorIconsSvg,
          placeholderBuilder: (BuildContext context) => const SizedBox(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      } else if (imageUrlType == CustomImageUrlType.FILE) {
        return Expanded(
          child: SvgPicture.file(
            file!,
            fit: fit!,
            height: height,
            width: width,
            placeholderBuilder: (BuildContext context) => const SizedBox(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        );
      } else if (imageUrlType == CustomImageUrlType.ICON) {
        return SizedBox(
          height: height,
          width: width,
          child: Icon(
            icon,
            color: color,
          ),
        );
      }
    }

    if (imageType == CustomImageType.NOT_IMAGE) {
      return Image.asset(
        ImagesPath.placeHolder,
        fit: fit,
        width: width ?? CustomSizeUtil.setSizeWithWidth(percent: .1),
        height: height ?? CustomSizeUtil.setSizeWithWidth(percent: .1),
      );
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    final imageType = checkImageType(urlImage.toString());
    final imageUrlType = checkImageUrlType(urlImage.toString());
    return imageTypeWidget(
      urlImage.toString(),
      imageType,
      imageUrlType,
    );
  }
}
