import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:momo/core/constants/colors.dart';
import 'package:momo/core/constants/default_values.dart';
import 'package:momo/core/constants/dimension_theme.dart';
import 'package:momo/core/extensions/ex_build_context.dart';
import 'package:momo/core/extensions/ex_padding.dart';
import 'package:momo/core/functions/f_is_null.dart';
import 'package:momo/core/services/navigation_service.dart';
import 'package:momo/core/widgets/image/w_image.dart';
import 'package:momo/core/widgets/w_bottom_nav_button.dart';
import 'package:momo/core/widgets/w_pop_button.dart';
import 'package:momo/features/explore/data/model/m_explore.dart';
import 'package:momo/features/explore/view/s_get_started.dart';
import 'package:momo/gen/assets.gen.dart';

class SGetThisPack extends StatefulWidget {
  final EItem? eItem;
  const SGetThisPack({super.key, this.eItem});

  @override
  _SGetThisPackState createState() => _SGetThisPackState();
}

class _SGetThisPackState extends State<SGetThisPack> {
  final ScrollController _scrollController = ScrollController();
  double _opacity = 0.0;
  double _imageScale = 1.0;

  late final String title;
  late final String photoCount;
  late final String details;
  late final int specificationCount;
  late final int imageCount;

  @override
  void initState() {
    super.initState();

    // Cache computed values once
    title = widget.eItem?.title ?? PDefaultValues.noName;
    photoCount = "${widget.eItem?.images?.length ?? 0} Photos";
    details = widget.eItem?.details ?? PDefaultValues.noName;
    specificationCount = widget.eItem?.specifications?.length ?? 0;
    imageCount = widget.eItem?.images?.length ?? 0;

    _scrollController.addListener(_onScroll);
  }

  // Separate scroll listener to avoid inline function
  void _onScroll() {
    final offset = _scrollController.offset;
    final newOpacity = (offset / 290).clamp(0.0, 1.0);
    double newScale = 1.0;

    if (offset < 0) {
      newScale = 1 + (offset.clamp(-100, 0)).abs() / 1000;
    }

    // Only update if values changed significantly
    if ((newOpacity - _opacity).abs() > 0.01 ||
        (newScale - _imageScale).abs() > 0.01) {
      setState(() {
        _opacity = newOpacity;
        _imageScale = newScale;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double topSectionHeight = 400;

    return Scaffold(
      body: Stack(
        children: [
          // Top image section
          _buildTopImageSection(context, topSectionHeight),

          // Main content
          _buildMainContent(context, topSectionHeight),
        ],
      ),
    );
  }

  Widget _buildTopImageSection(BuildContext context, double topSectionHeight) {
    return Column(
      children: [
        SizedBox(
          height: topSectionHeight.h,
          child: Opacity(
            opacity: 1.0 - _opacity,
            child: Transform.scale(
              scale: _imageScale,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  WImage(
                    !isNull(widget.eItem?.images)
                        ? widget.eItem?.images?.first
                        : "No Image",
                  ),
                  Container(
                    decoration: BoxDecoration(gradient: PColors.imageFG),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Text(title, style: context.textTheme?.titleLarge),
                        Text(photoCount, style: context.textTheme?.titleLarge),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }

  Widget _buildMainContent(BuildContext context, double topSectionHeight) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,

      bottomNavigationBar: WBottomNavButton(
        label: "Get This Pack",
        ontap: () async {
          SGetStarted(eItem: widget.eItem).pushReplacement();
        },
      ).pAll(),

      appBar: _buildAppBar(context),

      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [gapY(topSectionHeight), _buildContentSection(context)],
            ),
          ),

          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: PTheme.paddingX),
            sliver: SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.3,
                mainAxisSpacing: PTheme.spaceX,
                crossAxisSpacing: PTheme.spaceX,
              ),
              itemCount: imageCount,
              itemBuilder: (context, index) =>
                  _GridItem(widget.eItem?.images?[index] ?? "No Image"),
            ),
          ),

          SliverToBoxAdapter(child: gapY(80)),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      elevation: 0,
      backgroundColor: Colors.black.withAlpha(_opacity == 1 ? 255 : 0),
      leading: Center(child: WPButton(onTap: Navigation.pop)),
      centerTitle: true,
      title: Opacity(
        opacity: _opacity,
        child: Text(title, style: context.textTheme?.titleLarge),
      ),
    );
  }

  Widget _buildContentSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(PTheme.boarderRadius),
          topRight: Radius.circular(PTheme.boarderRadius),
        ),
      ),
      child: Column(
        spacing: PTheme.spaceY,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          Text(details, style: context.textTheme?.bodySmall),
          Text('Styles & Avatars', style: context.textTheme?.titleSmall),
          _buildSpecificationList(context),
          Text('Example Outputs', style: context.textTheme?.titleSmall),
        ],
      ).pAll(),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Text('What\'s Inside', style: context.textTheme?.titleSmall),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: BoxDecoration(
            color: context.primaryTextColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            "SNEAK PEEK",
            style: context.textTheme?.titleSmall?.copyWith(
              color: context.backgroundColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSpecificationList(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(0),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: specificationCount,
      itemBuilder: (_, index) => _SpecificationItem(
        text: widget.eItem?.specifications?[index] ?? PDefaultValues.noName,
      ),
    );
  }
}

class _GridItem extends StatelessWidget {
  final String url;
  const _GridItem(this.url);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(PTheme.boarderRadius),
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.hardEdge,
        children: [
          WImage(url),
          Container(decoration: BoxDecoration(gradient: PColors.imageFG)),
        ],
      ),
    );
  }
}

class _SpecificationItem extends StatelessWidget {
  final String text;

  const _SpecificationItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        spacing: PTheme.paddingX,
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.circle,
            color: context.secondaryTextColor,
            size: context.textTheme?.bodySmall?.fontSize,
          ).pV(value: 2.5),
          Expanded(child: Text(text, style: context.textTheme?.bodySmall)),
        ],
      ),
    );
  }
}
