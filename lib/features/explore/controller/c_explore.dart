import 'package:momo/core/controllers/c_base.dart';
import 'package:momo/features/explore/data/model/m_explore.dart';
import 'package:momo/features/oneshot/data/model/m_oneshot.dart';

class CExplore extends CBase {
  final List<MExplore>? _itemList = [
    MExplore(
      title: "Executive Suits for Professionals",
      items: [
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792779/Image_View-25_copy_twe8fy.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792778/Group_1321314636_z0yrcc.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792774/Image_View-17_ladvgq.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792774/Image_View-27_utsqfn.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792773/Image_View-26_modhdk.png",
          ],
          title: "Confident Tie Adjust",
          details:
              "Young woman adjusting black tie in sleek suit for assertive leadership image",
          specifications: [
            "Style: Tailored Formal",
            "Occasion: Board Meetings",
            "Hair: Ponytail Brown",
            "Accessories: Slim Tie",
          ],
        ),
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792778/Image_View-29_u3vffc.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792774/Image_View-16_wshrxb.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792772/Image_View-24_t288bh.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792772/Image_View-25_gamgdd.png",
          ],
          title: "Outdoor Executive Pose",
          details:
              "Woman in black blazer posing confidently outdoors for dynamic corporate presence",
          specifications: [
            "Color: Black",
            "Fit: Slim Cut",
            "Occasion: Networking Events",
            "Background: Urban Nature",
          ],
        ),
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792779/Group_1321314635_w1kdzn.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792776/Image_View-14_bxgyeo.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792775/Image_View-15_crnmsu.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792771/Image_View-20_n2dyig.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792771/Image_View-21_vtydix.png",
          ],
          title: "Plaid Power Suit",
          details:
              "Edgy gray plaid outfit with belt for innovative business roles",
          specifications: [
            "Pattern: Checkered Gray",
            "Style: Modern Oversized",
            "Occasion: Startup Pitches",
            "Accessories: Chain Necklace",
          ],
        ),
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792776/Image_View-11_g8hkij.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792770/Image_View-22_jdt8w6.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792769/Image_View-23_pifcci.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792769/Image_View_l8vrhw.png",
          ],
          title: "Casual Suit Lean",
          details:
              "Relaxed pose in black suit against wall for approachable executive style",
          specifications: [
            "Material: Wool Blend",
            "Fit: Relaxed Tailored",
            "Occasion: Team Leadership",
            "Pose: Leaning Casual",
          ],
        ),
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792776/Image_View-9_cllxvr.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792768/Image_View-28_o7fb3e.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792767/Image_View-4_sgwyum.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792766/Image_View-5_jral1j.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792766/Image_View-7_mjdpw8.png",
          ],
          title: "Vest and Shirt Combo",
          details:
              "Gray vest over blue shirt for layered professional appearance",
          specifications: [
            "Color: Slate Gray",
            "Style: Three-Piece",
            "Occasion: Client Presentations",
            "Hair: Wavy Black",
          ],
        ),
      ],
    ),
    MExplore(
      title: "Business Casual Vibes",
      items: [
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792780/Image_qbuwud.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792765/Image_View-19_uqkdrq.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792765/Image_View-6_colptd.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792765/Image_View-2_xqmlv1.png",
          ],
          title: "Soft Cardigan Work",
          details:
              "Woman in pink sweater with laptop for friendly remote work image",
          specifications: [
            "Style: Cozy Casual",
            "Occasion: Virtual Calls",
            "Hair: Blonde Wavy",
            "Accessories: Handbag",
          ],
        ),
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792780/Image-3_uacxlh.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792765/Image_View-3_uyx9wp.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792765/Image_View-18_epmjxa.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792764/Image_View-8_g8qo77.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792764/Image_View-12_ctgttw.png",
          ],
          title: "Denim Podcast Setup",
          details:
              "Blue denim shirt with mic and headphones for engaging content creator look",
          specifications: [
            "Material: Denim Fabric",
            "Fit: Button-Down",
            "Occasion: Media Recording",
            "Background: Studio Setup",
          ],
        ),
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792779/Group_1321314637_vzre5l.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792764/Image-1_t0vpk1.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792764/Group_1321314622_ozbhbf.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792764/Rectangle_160555_ru5acs.png",
          ],
          title: "Colorful Blazer Smile",
          details:
              "Bright blue suit with green top for vibrant and confident persona",
          specifications: [
            "Color: Turquoise Blue",
            "Style: Bold Colored",
            "Occasion: Creative Conferences",
            "Accessories: Statement Earrings",
          ],
        ),
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792777/Image_View-1_dylnze.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792763/Image_View-13_gmevxl.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792763/Image-2_yqrohh.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762793373/IMG_3963_1_fouocn.png",
          ],
          title: "Library Intellectual Attire",
          details: "Black top amid bookshelves for knowledgeable expert vibe",
          specifications: [
            "Style: Scholarly Casual",
            "Fit: Fitted Top",
            "Occasion: Educational Webinars",
            "Background: Book-Filled",
          ],
        ),
      ],
    ),
    MExplore(
      title: "Creative Industry Profiles",
      items: [
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792776/Image_View-14_bxgyeo.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792775/Image_View-15_crnmsu.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792774/Image_View-16_wshrxb.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792774/Image_View-17_ladvgq.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792774/Image_View-27_utsqfn.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792773/Image_View-26_modhdk.png",
          ],
          title: "Urban Plaid Crop",
          details:
              "Gray checkered crop top and blazer for trendy creative fields",
          specifications: [
            "Pattern: Plaid Modern",
            "Style: Edgy Urban",
            "Occasion: Design Workshops",
            "Hair: Straight Black",
          ],
        ),
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792772/Image_View-24_t288bh.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792772/Image_View-25_gamgdd.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792771/Image_View-20_n2dyig.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792771/Image_View-21_vtydix.png",
          ],
          title: "Leaning Fence Pose",
          details:
              "Black suit leaning on fence for artistic and relaxed professional shot",
          specifications: [
            "Color: Monochrome Black",
            "Fit: Classic Suit",
            "Occasion: Art Gallery Openings",
            "Pose: Dynamic Lean",
          ],
        ),
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792770/Image_View-22_jdt8w6.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792769/Image_View-23_pifcci.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792769/Image_View_l8vrhw.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792768/Image_View-28_o7fb3e.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792767/Image_View-4_sgwyum.png",
          ],
          title: "Tree Lean Dramatic",
          details:
              "Woman leaning on tree in suit with head back for expressive creative profile",
          specifications: [
            "Style: Dramatic Pose",
            "Occasion: Portfolio Shoots",
            "Hair: Ponytail Highlighted",
            "Lighting: Natural Outdoor",
          ],
        ),
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792766/Image_View-5_jral1j.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792766/Image_View-7_mjdpw8.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792765/Image_View-19_uqkdrq.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792765/Image_View-6_colptd.png",
          ],
          title: "Arms Outspread Suit",
          details:
              "Open arms in black suit against fence for welcoming innovative image",
          specifications: [
            "Pose: Expressive Open",
            "Fit: Fitted Formal",
            "Occasion: Creative Brainstorming",
            "Accessories: Pin Badge",
          ],
        ),
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792765/Image_View-2_xqmlv1.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792765/Image_View-3_uyx9wp.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792765/Image_View-18_epmjxa.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792764/Image_View-8_g8qo77.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792764/Image_View-12_ctgttw.png",
          ],
          title: "Casual Walking Suit",
          details:
              "Mid-step in black suit outdoors for energetic creative professional",
          specifications: [
            "Style: Motion Casual",
            "Occasion: Freelance Meetings",
            "Hair: Loose Wavy",
            "Footwear: Sneakers",
          ],
        ),
      ],
    ),
    MExplore(
      title: "Office and Remote Work Styles",
      items: [
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792764/Image-1_t0vpk1.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792764/Group_1321314622_ozbhbf.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792764/Rectangle_160555_ru5acs.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792763/Image_View-13_gmevxl.png",
          ],
          title: "Laptop Office Smile",
          details:
              "Woman typing on laptop in blazer for productive office environment",
          specifications: [
            "Style: Smart Casual",
            "Occasion: Daily Work",
            "Hair: Straight Brown",
            "Accessories: Earrings",
          ],
        ),
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792763/Image-2_yqrohh.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792780/Image-3_uacxlh.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792778/Image_View-29_u3vffc.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792777/Image_View-1_dylnze.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792776/Image_View-9_cllxvr.png",
          ],
          title: "Folder Holding Professional",
          details:
              "Holding documents in beige blazer for reliable business consultant look",
          specifications: [
            "Color: Neutral Beige",
            "Fit: Structured Blazer",
            "Occasion: Client Reviews",
            "Props: Folder",
          ],
        ),
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762793373/IMG_3963_1_fouocn.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792764/Image_View-12_ctgttw.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792776/Image_View-11_g8hkij.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792779/Group_1321314637_vzre5l.png",
          ],
          title: "Polo Casual Stance",
          details: "Man in green polo with watch for everyday office casual",
          specifications: [
            "Style: Relaxed Polo",
            "Occasion: Team Huddles",
            "Hair: Short Dark",
            "Accessories: Wristwatch",
          ],
        ),
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792780/Image_qbuwud.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792779/Image_View-25_copy_twe8fy.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792779/Group_1321314635_w1kdzn.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792778/Group_1321314636_z0yrcc.png",
          ],
          title: "Wavy Hair Remote",
          details:
              "Close-up with wavy hair for warm and approachable remote worker",
          specifications: [
            "Hair: Wavy Highlighted",
            "Lighting: Dramatic Soft",
            "Occasion: Home Office",
            "Style: Natural Minimal",
          ],
        ),
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792776/Image_View-14_bxgyeo.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792775/Image_View-15_crnmsu.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792774/Image_View-16_wshrxb.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792774/Image_View-17_ladvgq.png",
          ],
          title: "White Blazer Stand",
          details:
              "Blonde in white blazer holding hands in pockets for clean office aesthetic",
          specifications: [
            "Color: Crisp White",
            "Fit: Sleek Blazer",
            "Occasion: Corporate Training",
            "Accessories: Necklace",
          ],
        ),
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792776/Image_View-11_g8hkij.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792770/Image_View-22_jdt8w6.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792769/Image_View-23_pifcci.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792769/Image_View_l8vrhw.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792768/Image_View-28_o7fb3e.png",
          ],
          title: "Blue Blazer Laptop",
          details:
              "Woman at desk with laptop in navy blazer for focused work mode",
          specifications: [
            "Style: Office Ready",
            "Occasion: Daily Tasks",
            "Hair: Long Straight",
            "Props: Laptop",
          ],
        ),
      ],
    ),
    MExplore(
      title: "Media and Podcast Attire",
      items: [
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792778/Image_View-29_u3vffc.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792777/Image_View-1_dylnze.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792776/Image_View-9_cllxvr.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792776/Image_View-11_g8hkij.png",
          ],
          title: "Denim Mic Hold",
          details:
              "Holding microphone in denim for casual podcast host appearance",
          specifications: [
            "Material: Denim Casual",
            "Occasion: Audio Recording",
            "Hair: Wavy Dark",
            "Accessories: Headphones",
          ],
        ),
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792779/Group_1321314637_vzre5l.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792779/Image_View-25_copy_twe8fy.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792779/Group_1321314635_w1kdzn.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792778/Group_1321314636_z0yrcc.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792777/Image_View-1_dylnze.png",
          ],
          title: "Library Mic Smile",
          details:
              "Smiling with mic in book-filled room for intellectual podcast vibe",
          specifications: [
            "Style: Scholarly Media",
            "Fit: Short Sleeve",
            "Occasion: Book Discussions",
            "Background: Library",
          ],
        ),
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792765/Image_View-19_uqkdrq.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792765/Image_View-6_colptd.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792765/Image_View-2_xqmlv1.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792765/Image_View-3_uyx9wp.png",
          ],
          title: "Colorful Earring Host",
          details: "Bright suit with earrings for lively media personality",
          specifications: [
            "Color: Vivid Blue",
            "Style: Energetic",
            "Occasion: Live Streams",
            "Accessories: Bold Jewelry",
          ],
        ),
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792765/Image_View-18_epmjxa.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792764/Image_View-8_g8qo77.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792764/Image_View-12_ctgttw.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792764/Image-1_t0vpk1.png",
          ],
          title: "Pink Blazer Glow",
          details: "Pink blazer with tablet for enthusiastic content creation",
          specifications: [
            "Color: Pastel Pink",
            "Fit: Loose Blazer",
            "Occasion: Video Podcasts",
            "Lighting: Neon Gradient",
          ],
        ),
      ],
    ),
    MExplore(
      title: "Tech and Startup Outfits",
      items: [
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792764/Group_1321314622_ozbhbf.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792764/Rectangle_160555_ru5acs.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792763/Image_View-13_gmevxl.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792763/Image-2_yqrohh.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792780/Image_qbuwud.png",
          ],
          title: "Sunglasses Urban Walk",
          details:
              "Man in white outfit with backpack for mobile tech entrepreneur",
          specifications: [
            "Style: Street Casual",
            "Occasion: Startup Networking",
            "Hair: Short Styled",
            "Accessories: Sunglasses",
          ],
        ),
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792776/Image_View-14_bxgyeo.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792775/Image_View-15_crnmsu.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792774/Image_View-16_wshrxb.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792774/Image_View-17_ladvgq.png",
          ],
          title: "Plaid Tech Blazer",
          details: "Gray plaid with crop for modern tech event attendance",
          specifications: [
            "Pattern: Tech Plaid",
            "Style: Innovative Casual",
            "Occasion: Hackathons",
            "Accessories: Belt",
          ],
        ),
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792773/Image_View-26_modhdk.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792772/Image_View-24_t288bh.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792772/Image_View-25_gamgdd.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792771/Image_View-20_n2dyig.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792771/Image_View-21_vtydix.png",
          ],
          title: "Black Jacket Sit",
          details:
              "Sitting on steps in black jacket for thoughtful startup founder",
          specifications: [
            "Material: Puffer Jacket",
            "Fit: Casual Layered",
            "Occasion: Ideation Sessions",
            "Background: Architectural",
          ],
        ),
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792770/Image_View-22_jdt8w6.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792769/Image_View-23_pifcci.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792769/Image_View_l8vrhw.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792768/Image_View-28_o7fb3e.png",
          ],
          title: "Executive Desk Work",
          details: "Man at desk with laptop in suit for tech CEO profile",
          specifications: [
            "Style: Corporate Tech",
            "Occasion: Investor Calls",
            "Hair: Slicked Back",
            "Props: Trophy Decor",
          ],
        ),
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792767/Image_View-4_sgwyum.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792766/Image_View-5_jral1j.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792766/Image_View-7_mjdpw8.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792765/Image_View-19_uqkdrq.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792765/Image_View-6_colptd.png",
          ],
          title: "White Tee Stroll",
          details: "Casual white t-shirt with backpack for agile startup life",
          specifications: [
            "Style: Minimal Tech",
            "Fit: Relaxed Tee",
            "Occasion: Co-Working Spaces",
            "Accessories: Smartwatch",
          ],
        ),
      ],
    ),
    MExplore(
      title: "Headshot Portraits Collection",
      items: [
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792765/Image_View-2_xqmlv1.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792765/Image_View-3_uyx9wp.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792765/Image_View-18_epmjxa.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792764/Image_View-8_g8qo77.png",
          ],
          title: "Dark Shirt Intense",
          details:
              "Man in black shirt with beard for strong professional headshot",
          specifications: [
            "Style: Dramatic Close-Up",
            "Lighting: Low Key",
            "Occasion: Leadership Profiles",
            "Hair: Short Brown",
          ],
        ),
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792764/Image_View-12_ctgttw.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792764/Image-1_t0vpk1.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792764/Group_1321314622_ozbhbf.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792764/Rectangle_160555_ru5acs.png",
          ],
          title: "Blonde Wavy Smile",
          details: "Blonde woman smiling in white blazer for friendly portrait",
          specifications: [
            "Hair: Long Blonde",
            "Style: Bright Positive",
            "Occasion: Social Media Bios",
            "Accessories: Pearl Earrings",
          ],
        ),
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792763/Image_View-13_gmevxl.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792763/Image-2_yqrohh.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792780/Image_qbuwud.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792780/Image-3_uacxlh.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792779/Group_1321314637_vzre5l.png",
          ],
          title: "Black Turtleneck Gaze",
          details:
              "Woman in black turtleneck with intense look for artistic headshot",
          specifications: [
            "Color: All Black",
            "Lighting: Rim Light",
            "Occasion: Creative Bios",
            "Hair: Shoulder Wavy",
          ],
        ),
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792779/Image_View-25_copy_twe8fy.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792779/Group_1321314635_w1kdzn.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792778/Image_View-29_u3vffc.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792778/Group_1321314636_z0yrcc.png",
          ],
          title: "Blue Eyes Buttoned",
          details: "Man in black buttoned shirt for clean and sharp portrait",
          specifications: [
            "Style: Classic Headshot",
            "Fit: Fitted Shirt",
            "Occasion: Resume Photos",
            "Hair: Spiked Blonde",
          ],
        ),
      ],
    ),
    MExplore(
      title: "Diverse Professional Themes",
      items: [
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792777/Image_View-1_dylnze.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792776/Image_View-9_cllxvr.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792776/Image_View-11_g8hkij.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792776/Image_View-14_bxgyeo.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792775/Image_View-15_crnmsu.png",
          ],
          title: "Couple Professional Hug",
          details: "Couple in casual embrace for collaborative team image",
          specifications: [
            "Style: Partner Casual",
            "Occasion: Joint Ventures",
            "Hair: Short and Long",
            "Pose: Affectionate",
          ],
        ),
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792774/Image_View-16_wshrxb.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792774/Image_View-17_ladvgq.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792774/Image_View-27_utsqfn.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792773/Image_View-26_modhdk.png",
          ],
          title: "Leather Jacket Stare",
          details:
              "Man in leather jacket with serious gaze for edgy professional",
          specifications: [
            "Material: Leather Outer",
            "Style: Rugged Formal",
            "Occasion: Field Work",
            "Lighting: Black and White",
          ],
        ),
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792772/Image_View-24_t288bh.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792772/Image_View-25_gamgdd.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792771/Image_View-20_n2dyig.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792771/Image_View-21_vtydix.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792770/Image_View-22_jdt8w6.png",
          ],
          title: "Gray Suit Stand",
          details: "Woman in gray suit posing for sophisticated tech role",
          specifications: [
            "Color: Charcoal Gray",
            "Fit: Vest Included",
            "Occasion: Panel Discussions",
            "Hair: Long Black",
          ],
        ),
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792769/Image_View-23_pifcci.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792769/Image_View_l8vrhw.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792768/Image_View-28_o7fb3e.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792767/Image_View-4_sgwyum.png",
          ],
          title: "Necklace Shirt Close",
          details:
              "Man with necklace in open black shirt for stylish diverse profile",
          specifications: [
            "Style: Open Collar",
            "Accessories: Pendant",
            "Occasion: Networking Mixers",
            "Hair: Highlighted Blonde",
          ],
        ),
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792766/Image_View-5_jral1j.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792766/Image_View-7_mjdpw8.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792765/Image_View-19_uqkdrq.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792765/Image_View-6_colptd.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792765/Image_View-2_xqmlv1.png",
          ],
          title: "Beige Blazer Hold",
          details: "Holding folder in beige suit for inclusive business image",
          specifications: [
            "Color: Soft Beige",
            "Style: Professional Hold",
            "Occasion: Diversity Seminars",
            "Hair: Long Brunette",
          ],
        ),
      ],
    ),
    MExplore(
      title: "Modern Corporate Portraits",
      items: [
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792765/Image_View-3_uyx9wp.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792765/Image_View-18_epmjxa.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792764/Image_View-8_g8qo77.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792764/Image_View-12_ctgttw.png",
          ],
          title: "Black Shirt Bearded",
          details: "Bearded man in black shirt for mature corporate headshot",
          specifications: [
            "Style: Bearded Formal",
            "Lighting: Shadowed",
            "Occasion: Executive Bios",
            "Hair: Short Trimmed",
          ],
        ),
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792764/Image-1_t0vpk1.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792764/Group_1321314622_ozbhbf.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792764/Rectangle_160555_ru5acs.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792763/Image_View-13_gmevxl.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792763/Image-2_yqrohh.png",
          ],
          title: "White Blazer Confident",
          details:
              "Blonde in white blazer with hands in pockets for assured portrait",
          specifications: [
            "Color: Pure White",
            "Pose: Hands Pocketed",
            "Occasion: Company Websites",
            "Hair: Long Blonde",
          ],
        ),
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762793373/IMG_3963_1_fouocn.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792780/Image_qbuwud.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792780/Image-3_uacxlh.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792779/Group_1321314637_vzre5l.png",
          ],
          title: "Turtleneck Dramatic",
          details:
              "Woman in sheer black turtleneck with rim lighting for elegant corporate",
          specifications: [
            "Material: Sheer Fabric",
            "Style: High Neck",
            "Lighting: Edge Highlight",
            "Occasion: Annual Reports",
          ],
        ),
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792779/Image_View-25_copy_twe8fy.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792779/Group_1321314635_w1kdzn.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792778/Image_View-29_u3vffc.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792778/Group_1321314636_z0yrcc.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792777/Image_View-1_dylnze.png",
          ],
          title: "Blonde Spiked Portrait",
          details:
              "Man with spiked hair in black shirt for contemporary corporate look",
          specifications: [
            "Hair: Spiked Highlighted",
            "Style: Modern Shirt",
            "Occasion: Marketing Teams",
            "Accessories: None",
          ],
        ),
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792776/Image_View-9_cllxvr.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792776/Image_View-11_g8hkij.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792776/Image_View-14_bxgyeo.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792775/Image_View-15_crnmsu.png",
          ],
          title: "Blue Vest Serious",
          details:
              "Woman in blue vest and gray suit for focused corporate image",
          specifications: [
            "Color: Blue Gray",
            "Fit: Vest Suit",
            "Occasion: Strategy Sessions",
            "Hair: Wavy Dark",
          ],
        ),
      ],
    ),
    MExplore(
      title: "Modern Corporate Portraits",
      items: [
        EItem(
          images: [],
          title: "Black Shirt Bearded",
          details: "Bearded man in black shirt for mature corporate headshot",
          specifications: [
            "Style: Bearded Formal",
            "Lighting: Shadowed",
            "Occasion: Executive Bios",
            "Hair: Short Trimmed",
          ],
        ),
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792764/Image-1_t0vpk1.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792764/Group_1321314622_ozbhbf.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792764/Rectangle_160555_ru5acs.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792763/Image_View-13_gmevxl.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792763/Image-2_yqrohh.png",
          ],
          title: "White Blazer Confident",
          details:
              "Blonde in white blazer with hands in pockets for assured portrait",
          specifications: [
            "Color: Pure White",
            "Pose: Hands Pocketed",
            "Occasion: Company Websites",
            "Hair: Long Blonde",
          ],
        ),
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762793373/IMG_3963_1_fouocn.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792780/Image_qbuwud.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792780/Image-3_uacxlh.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792779/Group_1321314637_vzre5l.png",
          ],
          title: "Turtleneck Dramatic",
          details:
              "Woman in sheer black turtleneck with rim lighting for elegant corporate",
          specifications: [
            "Material: Sheer Fabric",
            "Style: High Neck",
            "Lighting: Edge Highlight",
            "Occasion: Annual Reports",
          ],
        ),
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792779/Image_View-25_copy_twe8fy.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792779/Group_1321314635_w1kdzn.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792778/Image_View-29_u3vffc.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792778/Group_1321314636_z0yrcc.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792777/Image_View-1_dylnze.png",
          ],
          title: "Blonde Spiked Portrait",
          details:
              "Man with spiked hair in black shirt for contemporary corporate look",
          specifications: [
            "Hair: Spiked Highlighted",
            "Style: Modern Shirt",
            "Occasion: Marketing Teams",
            "Accessories: None",
          ],
        ),
        EItem(
          images: [
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792776/Image_View-9_cllxvr.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792776/Image_View-11_g8hkij.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792776/Image_View-14_bxgyeo.png",
            "https://res.cloudinary.com/dskavcx9z/image/upload/v1762792775/Image_View-15_crnmsu.png",
          ],
          title: "Blue Vest Serious",
          details:
              "Woman in blue vest and gray suit for focused corporate image",
          specifications: [
            "Color: Blue Gray",
            "Fit: Vest Suit",
            "Occasion: Strategy Sessions",
            "Hair: Wavy Dark",
          ],
        ),
      ],
    ),
  ];
  List<MExplore>? get exploreList => _itemList;
}
