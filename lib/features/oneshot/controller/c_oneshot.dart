import 'package:momo/core/controllers/c_base.dart';
import 'package:momo/core/functions/f_is_null.dart';
import 'package:momo/core/services/navigation_service.dart';
import 'package:momo/features/oneshot/data/model/m_oneshot.dart';
import 'package:momo/features/oneshot/view/s_photo_with_prompt.dart';
import 'package:momo/features/oneshot/view/s_photo_without_prompt.dart';

class COneShot extends CBase {
  final List<MOneshot>? _oneShotList = [
    MOneshot(
      title: "LinkedIn Headshot Essentials",
      items: [
        OItem(
          title: "Executive Confidence",
          subTitle: "Tailored Black Suit",
          image:
              "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792779/Image_View-25_copy_twe8fy.png",
          imageBehaildText: [
            "Select your face",
            "Select partner image (optional)",
          ],
        ),
        OItem(
          title: "Creative Professional",
          subTitle: "Denim & Headphones",
          image:
              "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792780/Image_qbuwud.png",
          prompt:
              "Young professional in blue denim shirt wearing headphones, creative workspace background, natural light.",
          imageBehaildText: [
            "Upload your portrait",
            "Add team member (optional)",
          ],
        ),
        OItem(
          title: "Modern Minimalist",
          subTitle: "Gray Plaid Blazer",
          image:
              "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792779/Group_1321314637_vzre5l.png",
          prompt:
              "Stylish oversized gray plaid blazer, urban background, clean and modern LinkedIn profile photo.",
          imageBehaildText: ["Choose your image", "Select colleague photo"],
        ),
        OItem(
          title: "Intellectual Presence",
          subTitle: "Library Setting",
          image:
              "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792777/Image_View-1_dylnze.png",
          prompt:
              "Thoughtful professional in black top, standing in front of bookshelves, warm ambient lighting.",
          imageBehaildText: ["Insert your headshot", "Add mentor image"],
        ),
        OItem(
          title: "Tech Leader Vibe",
          subTitle: "Vest & Shirt Combo",
          image:
              "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792776/Image_View-11_g8hkij.png",
          prompt:
              "Confident leader in gray vest over blue shirt, modern office backdrop, professional and approachable.",
          imageBehaildText: [
            "Upload your photo",
            "Include co-founder (optional)",
          ],
        ),
      ],
    ),

    MOneshot(
      title: "Corporate Power Portraits",
      items: [
        OItem(
          title: "Boardroom Ready",
          subTitle: "Tie Adjustment Pose",
          image:
              "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792778/Image_View-29_u3vffc.png",
          prompt:
              "Executive adjusting black tie in sleek suit, dramatic side lighting, high-end corporate feel.",
          imageBehaildText: ["Select your face"],
        ),
        OItem(
          title: "Outdoor Executive",
          subTitle: "Urban Blazer Pose",
          image:
              "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792774/Image_View-16_wshrxb.png",
          prompt:
              "Professional in black blazer standing outdoors, city skyline blurred in background, golden hour light.",
          imageBehaildText: ["Upload your portrait"],
        ),
        OItem(
          title: "Plaid Innovation",
          subTitle: "Checkered Crop Style",
          image:
              "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792776/Image_View-14_bxgyeo.png",
          prompt:
              "Trendy gray plaid crop top and blazer combo, modern startup office, vibrant and bold.",
          imageBehaildText: ["Choose your image", "Add startup co-founder"],
        ),
        OItem(
          title: "Relaxed Authority",
          subTitle: "Wall Lean Suit",
          image:
              "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792770/Image_View-22_jdt8w6.png",
          prompt:
              "Confident professional leaning against wall in black suit, relaxed yet authoritative pose.",
          imageBehaildText: ["Insert your headshot", "Add leadership team"],
        ),
        OItem(
          title: "Layered Professional",
          subTitle: "Vest Over Shirt",
          image:
              "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792766/Image_View-5_jral1j.png",
          prompt:
              "Sleek gray vest layered over white shirt, clean office setting, polished and composed.",
          imageBehaildText: ["Upload your photo", "Include department head"],
        ),
        OItem(
          title: "Dynamic Motion",
          subTitle: "Walking Confidence",
          image:
              "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792765/Image_View-2_xqmlv1.png",
          prompt:
              "Professional walking forward in tailored suit, motion blur background, energetic and driven.",
          imageBehaildText: ["Select your image", "Add event speaker"],
        ),
      ],
    ),

    MOneshot(
      title: "Creative Industry Looks",
      items: [
        OItem(
          title: "Podcast Host",
          subTitle: "Denim & Mic",
          image:
              "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792765/Image_View-19_uqkdrq.png",
          prompt:
              "Content creator holding microphone in denim shirt, studio setup with softbox lighting.",
          imageBehaildText: ["Upload your portrait", "Add co-host image"],
        ),
        OItem(
          title: "Design Thinker",
          subTitle: "Plaid Urban Edge",
          image:
              "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792773/Image_View-26_modhdk.png",
          prompt:
              "Creative in oversized plaid blazer, standing on city street, artistic color grading.",
          imageBehaildText: ["Choose your face", "Include design partner"],
        ),
        OItem(
          title: "Artistic Lean",
          subTitle: "Fence Pose Drama",
          image:
              "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792772/Image_View-24_t288bh.png",
          prompt:
              "Expressive pose leaning on fence in black suit, cinematic lighting, creative portfolio style.",
          imageBehaildText: ["Insert your headshot", "Add collaborator"],
        ),
        OItem(
          title: "Open Expression",
          subTitle: "Arms Wide Suit",
          image:
              "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792766/Image_View-7_mjdpw8.png",
          prompt:
              "Welcoming pose with arms open in tailored suit, outdoor park setting, warm sunlight.",
          imageBehaildText: ["Upload your photo", "Include team member"],
        ),
        OItem(
          title: "Storyteller Vibe",
          subTitle: "Library Mic Smile",
          image:
              "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792779/Group_1321314635_w1kdzn.png",
          prompt:
              "Smiling with microphone in front of bookshelves, intellectual and engaging podcast host look.",
          imageBehaildText: ["Select your image", "Add guest speaker"],
        ),
      ],
    ),

    MOneshot(
      title: "Startup & Tech Profiles",
      items: [
        OItem(
          title: "Founder Energy",
          subTitle: "Laptop at Desk",
          image:
              "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792764/Image-1_t0vpk1.png",
          prompt:
              "Startup founder working on laptop in modern office, focused expression, natural window light.",
          imageBehaildText: ["Upload your portrait", "Add co-founder image"],
        ),
        OItem(
          title: "Urban Hustle",
          subTitle: "Sunglasses & Backpack",
          image:
              "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792764/Group_1321314622_ozbhbf.png",
          prompt:
              "Tech entrepreneur walking in city with sunglasses and backpack, dynamic street background.",
          imageBehaildText: ["Choose your face", "Include investor photo"],
        ),
        OItem(
          title: "Pitch Ready",
          subTitle: "Folder in Hand",
          image:
              "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792763/Image-2_yqrohh.png",
          prompt:
              "Professional holding pitch folder in beige blazer, confident stance, clean conference room.",
          imageBehaildText: ["Insert your headshot", "Add advisor image"],
        ),
        OItem(
          title: "Casual Innovator",
          subTitle: "White Tee Stroll",
          image:
              "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792767/Image_View-4_sgwyum.png",
          prompt:
              "Relaxed tech innovator in white t-shirt and jeans, walking outdoors, smartwatch visible.",
          imageBehaildText: ["Upload your photo", "Include developer teammate"],
        ),
        OItem(
          title: "Visionary Pose",
          subTitle: "Tree Lean Drama",
          image:
              "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792769/Image_View-23_pifcci.png",
          prompt:
              "Dramatic pose leaning on tree with head back, black suit, golden hour cinematic light.",
          imageBehaildText: ["Select your image", "Add visionary partner"],
        ),
        OItem(
          title: "Agile Leader",
          subTitle: "Steps Sitting",
          image:
              "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792771/Image_View-20_n2dyig.png",
          prompt:
              "Thoughtful leader sitting on modern steps in puffer jacket, architectural background.",
          imageBehaildText: ["Choose your portrait", "Include product lead"],
        ),
      ],
    ),

    MOneshot(
      title: "Remote Work Professionals",
      items: [
        OItem(
          title: "Home Office Pro",
          subTitle: "Cardigan & Laptop",
          image:
              "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792765/Image_View-6_colptd.png",
          prompt:
              "Remote worker in cozy cardigan using laptop, home office with plants, soft natural light.",
          imageBehaildText: ["Upload your face", "Add virtual teammate"],
        ),
        OItem(
          title: "Video Call Ready",
          subTitle: "Wavy Hair Close-Up",
          image:
              "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792779/Image_View-25_copy_twe8fy.png",
          prompt:
              "Close-up portrait with wavy hair, warm smile, perfect for Zoom profile picture.",
          imageBehaildText: ["Insert your headshot", "Include manager photo"],
        ),
        OItem(
          title: "Freelance Focus",
          subTitle: "Denim Podcast Setup",
          image:
              "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792765/Image_View-3_uyx9wp.png",
          prompt:
              "Freelancer recording podcast in denim shirt, mic and headphones, professional home studio.",
          imageBehaildText: ["Choose your image", "Add client avatar"],
        ),
        OItem(
          title: "Digital Nomad",
          subTitle: "Blazer & Tablet",
          image:
              "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792765/Image_View-18_epmjxa.png",
          prompt:
              "Nomad in pink blazer holding tablet, neon gradient background, modern and mobile.",
          imageBehaildText: ["Upload your portrait", "Include travel buddy"],
        ),
        OItem(
          title: "Virtual Presenter",
          subTitle: "White Blazer Stand",
          image:
              "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792775/Image_View-15_crnmsu.png",
          prompt:
              "Presenter in crisp white blazer, hands in pockets, clean background for webinars.",
          imageBehaildText: ["Select your photo", "Add co-presenter"],
        ),
      ],
    ),

    MOneshot(
      title: "Media & Content Creators",
      items: [
        OItem(
          title: "Live Stream Host",
          subTitle: "Colorful Blazer Glow",
          image:
              "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792764/Image_View-8_g8qo77.png",
          prompt:
              "Energetic host in bright blue suit with neon lighting, perfect for live streaming.",
          imageBehaildText: ["Upload your face", "Add guest streamer"],
        ),
        OItem(
          title: "Video Content Star",
          subTitle: "Pink Blazer Tablet",
          image:
              "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792764/Image_View-12_ctgttw.png",
          prompt:
              "Content creator in pastel pink blazer holding tablet, vibrant studio backdrop.",
          imageBehaildText: ["Choose your portrait", "Include editor image"],
        ),
        OItem(
          title: "Audio Storyteller",
          subTitle: "Library Mic Hold",
          image:
              "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792778/Group_1321314636_z0yrcc.png",
          prompt:
              "Podcaster holding mic in front of bookshelf, warm and intellectual atmosphere.",
          imageBehaildText: ["Insert your headshot", "Add producer photo"],
        ),
        OItem(
          title: "Visual Artist",
          subTitle: "Plaid Crop Drama",
          image:
              "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792774/Image_View-17_ladvgq.png",
          prompt:
              "Artist in gray plaid crop and blazer, dramatic pose, gallery-style lighting.",
          imageBehaildText: ["Upload your image", "Include muse or model"],
        ),
        OItem(
          title: "Brand Ambassador",
          subTitle: "Earrings & Smile",
          image:
              "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792764/Rectangle_160555_ru5acs.png",
          prompt:
              "Brand rep in turquoise suit with statement earrings, bright and confident smile.",
          imageBehaildText: ["Select your photo", "Add brand partner"],
        ),
        OItem(
          title: "Influencer Close-Up",
          subTitle: "Wavy Hair Drama",
          image:
              "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792780/Image-3_uacxlh.png",
          prompt:
              "Close-up with dramatic wavy hair and soft rim light, high-fashion influencer aesthetic.",
          imageBehaildText: ["Choose your face", "Include stylist image"],
        ),
      ],
    ),

    MOneshot(
      title: "Diversity & Inclusion Profiles",
      items: [
        OItem(
          title: "Team Collaboration",
          subTitle: "Couple Professional Hug",
          image:
              "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792776/Image_View-9_cllxvr.png",
          prompt:
              "Two professionals in casual embrace, symbolizing partnership and teamwork.",
          imageBehaildText: ["Upload Person A", "Upload Person B"],
        ),
        OItem(
          title: "Inclusive Leader",
          subTitle: "Beige Blazer Hold",
          image:
              "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792765/Image_View-6_colptd.png",
          prompt:
              "Diverse leader holding folder in beige suit, inclusive and approachable expression.",
          imageBehaildText: ["Insert your portrait", "Add team representative"],
        ),
        OItem(
          title: "Global Professional",
          subTitle: "Necklace Open Shirt",
          image:
              "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792769/Image_View_l8vrhw.png",
          prompt:
              "Professional with open-collar shirt and pendant, cultural fusion style, warm tone.",
          imageBehaildText: ["Upload your photo", "Include cultural advisor"],
        ),
        OItem(
          title: "Empowered Woman",
          subTitle: "Gray Suit Power",
          image:
              "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792771/Image_View-21_vtydix.png",
          prompt:
              "Strong woman in charcoal gray suit with vest, powerful stance, leadership presence.",
          imageBehaildText: ["Choose your image", "Add role model"],
        ),
        OItem(
          title: "Rugged Professional",
          subTitle: "Leather Jacket B&W",
          image:
              "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792774/Image_View-27_utsqfn.png",
          prompt:
              "Field expert in leather jacket, black and white, serious and experienced look.",
          imageBehaildText: ["Select your portrait", "Add field partner"],
        ),
      ],
    ),

    MOneshot(
      title: "Classic Corporate Headshots",
      items: [
        OItem(
          title: "Timeless Executive",
          subTitle: "Black Turtleneck",
          image:
              "https://res.cloudinary.com/dskavcx9z/image/upload/v1762793373/IMG_3963_1_fouocn.png",
          prompt:
              "Classic black turtleneck portrait, rim lighting, timeless corporate headshot style.",
          imageBehaildText: ["Upload your face", "Add board member"],
        ),
        OItem(
          title: "Clean & Sharp",
          subTitle: "Buttoned Shirt",
          image:
              "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792778/Image_View-29_u3vffc.png",
          prompt:
              "Man in black buttoned shirt, clean background, sharp and professional headshot.",
          imageBehaildText: ["Choose your portrait", "Include VP image"],
        ),
        OItem(
          title: "Bearded Authority",
          subTitle: "Dark Shirt Intense",
          image:
              "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792765/Image_View-3_uyx9wp.png",
          prompt:
              "Bearded professional in dark shirt, low-key lighting, strong and authoritative.",
          imageBehaildText: ["Insert your headshot", "Add senior director"],
        ),
        OItem(
          title: "Blonde Elegance",
          subTitle: "White Blazer Smile",
          image:
              "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792763/Image_View-13_gmevxl.png",
          prompt:
              "Blonde professional in white blazer, bright smile, clean and elegant composition.",
          imageBehaildText: ["Upload your photo", "Include HR lead"],
        ),
        OItem(
          title: "Strategic Thinker",
          subTitle: "Blue Vest Focus",
          image:
              "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792776/Image_View-14_bxgyeo.png",
          prompt:
              "Focused strategist in blue vest and gray suit, thoughtful expression, office setting.",
          imageBehaildText: ["Select your image", "Add strategy partner"],
        ),
        OItem(
          title: "Polished Professional",
          subTitle: "Spiked Hair Modern",
          image:
              "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792779/Group_1321314635_w1kdzn.png",
          prompt:
              "Modern professional with spiked blonde hair in black shirt, clean and contemporary.",
          imageBehaildText: ["Choose your face", "Include marketing head"],
        ),
      ],
    ),
  ];
  List<MOneshot>? get oneShotList => _oneShotList;
}

void navigateToOSUploadScreen(OItem? oitem) {
  if (isNull(oitem?.prompt)) {
    SPhotosWithOutPrompt(oItem: oitem ?? OItem()).push();
  } else {
    SPhotosWithPrompt(osItem: oitem ?? OItem()).push();
  }
}
