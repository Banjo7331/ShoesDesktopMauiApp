; ModuleID = 'marshal_methods.armeabi-v7a.ll'
source_filename = "marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [316 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [626 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 32687329, ; 3: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 236
	i32 34715100, ; 4: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 270
	i32 34839235, ; 5: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 39485524, ; 6: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42639949, ; 7: System.Threading.Thread => 0x28aa24d => 145
	i32 66541672, ; 8: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 9: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 311
	i32 68219467, ; 10: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 11: Microsoft.Maui.Graphics.dll => 0x44bb714 => 193
	i32 82292897, ; 12: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 98325684, ; 13: Microsoft.Extensions.Diagnostics.Abstractions => 0x5dc54b4 => 180
	i32 101534019, ; 14: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 254
	i32 117431740, ; 15: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 16: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 254
	i32 122350210, ; 17: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 134690465, ; 18: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 274
	i32 142721839, ; 19: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 20: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 21: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 22: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 210
	i32 176265551, ; 23: System.ServiceProcess => 0xa81994f => 132
	i32 182336117, ; 24: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 256
	i32 184328833, ; 25: System.ValueTuple.dll => 0xafca281 => 151
	i32 195452805, ; 26: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 308
	i32 199333315, ; 27: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 309
	i32 205061960, ; 28: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 29: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 208
	i32 220171995, ; 30: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 221958352, ; 31: Microsoft.Extensions.Diagnostics.dll => 0xd3ad0d0 => 179
	i32 230216969, ; 32: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 230
	i32 230752869, ; 33: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 34: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 35: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 36: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 261689757, ; 37: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 213
	i32 276479776, ; 38: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 39: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 232
	i32 280482487, ; 40: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 229
	i32 280992041, ; 41: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 280
	i32 291076382, ; 42: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 291275502, ; 43: Microsoft.Extensions.Http.dll => 0x115c82ee => 181
	i32 298918909, ; 44: System.Net.Ping.dll => 0x11d123fd => 69
	i32 317674968, ; 45: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 308
	i32 318968648, ; 46: Xamarin.AndroidX.Activity.dll => 0x13031348 => 199
	i32 321597661, ; 47: System.Numerics => 0x132b30dd => 83
	i32 336156722, ; 48: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 293
	i32 342366114, ; 49: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 231
	i32 356389973, ; 50: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 292
	i32 360082299, ; 51: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 52: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 53: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 54: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 55: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 56: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 57: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 58: _Microsoft.Android.Resource.Designer => 0x17969339 => 312
	i32 403441872, ; 59: WindowsBase => 0x180c08d0 => 165
	i32 435591531, ; 60: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 304
	i32 441335492, ; 61: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 214
	i32 442565967, ; 62: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 63: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 227
	i32 451504562, ; 64: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456227837, ; 65: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 66: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 67: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 68: System.dll => 0x1bff388e => 164
	i32 476646585, ; 69: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 229
	i32 486930444, ; 70: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 242
	i32 498788369, ; 71: System.ObjectModel => 0x1dbae811 => 84
	i32 500358224, ; 72: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 291
	i32 503918385, ; 73: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 285
	i32 513247710, ; 74: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 187
	i32 526420162, ; 75: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 76: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 274
	i32 530272170, ; 77: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 539058512, ; 78: Microsoft.Extensions.Logging => 0x20216150 => 182
	i32 540030774, ; 79: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 80: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 81: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 549171840, ; 82: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 83: Jsr305Binding => 0x213954e7 => 267
	i32 569601784, ; 84: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 265
	i32 577335427, ; 85: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 592146354, ; 86: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 299
	i32 601371474, ; 87: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 88: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 89: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 627609679, ; 90: Xamarin.AndroidX.CustomView => 0x2568904f => 219
	i32 627931235, ; 91: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 297
	i32 639843206, ; 92: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 225
	i32 643868501, ; 93: System.Net => 0x2660a755 => 81
	i32 662205335, ; 94: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 95: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 261
	i32 666292255, ; 96: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 206
	i32 672442732, ; 97: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 98: System.Net.Security => 0x28bdabca => 73
	i32 688181140, ; 99: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 279
	i32 690569205, ; 100: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 101: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 276
	i32 693804605, ; 102: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 103: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 104: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 271
	i32 700358131, ; 105: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 706645707, ; 106: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 294
	i32 709557578, ; 107: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 282
	i32 720511267, ; 108: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 275
	i32 722857257, ; 109: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 731701662, ; 110: Microsoft.Extensions.Options.ConfigurationExtensions => 0x2b9ce19e => 186
	i32 735137430, ; 111: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 752232764, ; 112: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 113: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 196
	i32 759454413, ; 114: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 115: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 775507847, ; 116: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 117: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 303
	i32 789151979, ; 118: Microsoft.Extensions.Options => 0x2f0980eb => 185
	i32 790371945, ; 119: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 220
	i32 804715423, ; 120: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 121: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 234
	i32 823281589, ; 122: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 123: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 124: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 125: System.Net.Quic => 0x31b69d60 => 71
	i32 843511501, ; 126: Xamarin.AndroidX.Print => 0x3246f6cd => 247
	i32 873119928, ; 127: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 128: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 129: System.Net.Http.Json => 0x3463c971 => 63
	i32 904024072, ; 130: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 908337989, ; 131: Refit => 0x36242345 => 194
	i32 911108515, ; 132: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 926902833, ; 133: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 306
	i32 928116545, ; 134: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 270
	i32 952186615, ; 135: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 956575887, ; 136: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 275
	i32 966729478, ; 137: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 268
	i32 967690846, ; 138: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 231
	i32 975236339, ; 139: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 140: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 141: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 142: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 992768348, ; 143: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 144: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 1001831731, ; 145: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 146: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 251
	i32 1019214401, ; 147: System.Drawing => 0x3cbffa41 => 36
	i32 1028951442, ; 148: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 178
	i32 1029334545, ; 149: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 281
	i32 1031528504, ; 150: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 269
	i32 1035644815, ; 151: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 204
	i32 1036536393, ; 152: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1044663988, ; 153: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1048992957, ; 154: Microsoft.Extensions.Diagnostics.Abstractions.dll => 0x3e865cbd => 180
	i32 1052210849, ; 155: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 238
	i32 1067306892, ; 156: GoogleGson => 0x3f9dcf8c => 173
	i32 1082857460, ; 157: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 158: Xamarin.Kotlin.StdLib => 0x409e66d8 => 272
	i32 1098259244, ; 159: System => 0x41761b2c => 164
	i32 1118262833, ; 160: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 294
	i32 1121599056, ; 161: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 237
	i32 1127624469, ; 162: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 184
	i32 1149092582, ; 163: Xamarin.AndroidX.Window => 0x447dc2e6 => 264
	i32 1168523401, ; 164: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 300
	i32 1170634674, ; 165: System.Web.dll => 0x45c677b2 => 153
	i32 1175144683, ; 166: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 260
	i32 1178241025, ; 167: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 245
	i32 1203215381, ; 168: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 298
	i32 1204270330, ; 169: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 206
	i32 1208641965, ; 170: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1209284920, ; 171: ShoesDesktopMauiApp.dll => 0x48143938 => 0
	i32 1219128291, ; 172: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1234928153, ; 173: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 296
	i32 1243150071, ; 174: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 265
	i32 1253011324, ; 175: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 176: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 280
	i32 1264511973, ; 177: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 255
	i32 1267360935, ; 178: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 259
	i32 1273260888, ; 179: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 211
	i32 1275534314, ; 180: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 276
	i32 1278448581, ; 181: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 203
	i32 1293217323, ; 182: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 222
	i32 1309188875, ; 183: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1322716291, ; 184: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 264
	i32 1324164729, ; 185: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 186: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1364015309, ; 187: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 188: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 310
	i32 1376866003, ; 189: Xamarin.AndroidX.SavedState => 0x52114ed3 => 251
	i32 1379779777, ; 190: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1402170036, ; 191: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 192: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 215
	i32 1408764838, ; 193: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 194: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 195: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1430672901, ; 196: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 278
	i32 1434145427, ; 197: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 198: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 268
	i32 1439761251, ; 199: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1452070440, ; 200: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 201: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1457743152, ; 202: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 203: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1461004990, ; 204: es\Microsoft.Maui.Controls.resources => 0x57152abe => 284
	i32 1461234159, ; 205: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 206: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 207: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 208: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 205
	i32 1470490898, ; 209: Microsoft.Extensions.Primitives => 0x57a5e912 => 187
	i32 1479771757, ; 210: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 211: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 212: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 213: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 252
	i32 1493001747, ; 214: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 288
	i32 1505131794, ; 215: Microsoft.Extensions.Http => 0x59b67d12 => 181
	i32 1514721132, ; 216: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 283
	i32 1536373174, ; 217: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 218: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 219: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1550322496, ; 220: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1551623176, ; 221: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 303
	i32 1565862583, ; 222: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 223: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 224: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 225: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582372066, ; 226: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 221
	i32 1592978981, ; 227: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 228: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 269
	i32 1601112923, ; 229: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1604827217, ; 230: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 231: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 232: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 241
	i32 1622358360, ; 233: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1624863272, ; 234: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 263
	i32 1635184631, ; 235: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 225
	i32 1636350590, ; 236: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 218
	i32 1639515021, ; 237: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 238: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 239: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 240: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 241: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 257
	i32 1658251792, ; 242: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 266
	i32 1670060433, ; 243: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 213
	i32 1675553242, ; 244: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 245: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 246: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 247: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1691477237, ; 248: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 249: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 250: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 273
	i32 1701541528, ; 251: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 252: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 234
	i32 1726116996, ; 253: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 254: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 255: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 209
	i32 1736233607, ; 256: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 301
	i32 1743415430, ; 257: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 279
	i32 1744735666, ; 258: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746316138, ; 259: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 260: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 261: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1763938596, ; 262: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 263: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 264: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 256
	i32 1770582343, ; 265: Microsoft.Extensions.Logging.dll => 0x6988f147 => 182
	i32 1776026572, ; 266: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 267: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 268: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 269: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 295
	i32 1788241197, ; 270: Xamarin.AndroidX.Fragment => 0x6a96652d => 227
	i32 1793755602, ; 271: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 287
	i32 1808609942, ; 272: Xamarin.AndroidX.Loader => 0x6bcd3296 => 241
	i32 1813058853, ; 273: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 272
	i32 1813201214, ; 274: Xamarin.Google.Android.Material => 0x6c13413e => 266
	i32 1818569960, ; 275: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 246
	i32 1818787751, ; 276: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 277: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 278: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1828688058, ; 279: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 183
	i32 1842015223, ; 280: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 307
	i32 1847515442, ; 281: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 196
	i32 1853025655, ; 282: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 304
	i32 1858542181, ; 283: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1870277092, ; 284: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1875935024, ; 285: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 286
	i32 1879696579, ; 286: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1885316902, ; 287: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 207
	i32 1888955245, ; 288: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 289: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1898237753, ; 290: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 291: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1901251850, ; 292: ShoesDesktopMauiApp => 0x7152cd0a => 0
	i32 1910275211, ; 293: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1939592360, ; 294: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1956758971, ; 295: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1961813231, ; 296: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 253
	i32 1968388702, ; 297: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 174
	i32 1983156543, ; 298: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 273
	i32 1985761444, ; 299: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 198
	i32 2003115576, ; 300: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 283
	i32 2011961780, ; 301: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 302: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 238
	i32 2025202353, ; 303: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 278
	i32 2031763787, ; 304: Xamarin.Android.Glide => 0x791a414b => 195
	i32 2045470958, ; 305: System.Private.Xml => 0x79eb68ee => 88
	i32 2048278909, ; 306: Microsoft.Extensions.Configuration.Binder.dll => 0x7a16417d => 176
	i32 2055257422, ; 307: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 233
	i32 2060060697, ; 308: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 309: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 282
	i32 2070888862, ; 310: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2079903147, ; 311: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2090596640, ; 312: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2127167465, ; 313: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 314: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 315: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 316: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 317: Microsoft.Maui => 0x80bd55ad => 191
	i32 2169148018, ; 318: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 290
	i32 2181898931, ; 319: Microsoft.Extensions.Options.dll => 0x820d22b3 => 185
	i32 2192057212, ; 320: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 183
	i32 2193016926, ; 321: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2201107256, ; 322: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 277
	i32 2201231467, ; 323: System.Net.Http => 0x8334206b => 64
	i32 2207618523, ; 324: it\Microsoft.Maui.Controls.resources => 0x839595db => 292
	i32 2217644978, ; 325: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 260
	i32 2222056684, ; 326: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2244775296, ; 327: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 242
	i32 2252106437, ; 328: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2256313426, ; 329: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 330: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 331: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 175
	i32 2267999099, ; 332: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 197
	i32 2270573516, ; 333: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 286
	i32 2279755925, ; 334: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 249
	i32 2293034957, ; 335: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 336: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 337: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 338: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 296
	i32 2305521784, ; 339: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2315684594, ; 340: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 201
	i32 2320631194, ; 341: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2340441535, ; 342: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 343: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2353062107, ; 344: System.Net.Primitives => 0x8c40e0db => 70
	i32 2368005991, ; 345: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2371007202, ; 346: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 174
	i32 2378619854, ; 347: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 348: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2395872292, ; 349: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 291
	i32 2401565422, ; 350: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 351: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 224
	i32 2421380589, ; 352: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 353: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 211
	i32 2427813419, ; 354: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 288
	i32 2435356389, ; 355: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 356: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2454642406, ; 357: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458678730, ; 358: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 359: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465532216, ; 360: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 214
	i32 2471841756, ; 361: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 362: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 363: Microsoft.Maui.Controls => 0x93dba8a1 => 189
	i32 2483903535, ; 364: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 365: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 366: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 367: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 368: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 236
	i32 2522472828, ; 369: Xamarin.Android.Glide.dll => 0x9659e17c => 195
	i32 2538310050, ; 370: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2550873716, ; 371: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 289
	i32 2562349572, ; 372: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 373: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2581783588, ; 374: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 237
	i32 2581819634, ; 375: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 259
	i32 2585220780, ; 376: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 377: System.Net.Ping => 0x9a20430d => 69
	i32 2589602615, ; 378: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2593496499, ; 379: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 298
	i32 2605712449, ; 380: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 277
	i32 2615233544, ; 381: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 228
	i32 2616218305, ; 382: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 184
	i32 2617129537, ; 383: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 384: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 385: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 218
	i32 2624644809, ; 386: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 223
	i32 2626831493, ; 387: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 293
	i32 2627185994, ; 388: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2629843544, ; 389: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 390: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 232
	i32 2663391936, ; 391: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 197
	i32 2663698177, ; 392: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 393: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 394: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 395: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 396: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2693849962, ; 397: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 398: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 257
	i32 2715334215, ; 399: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 400: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 401: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 402: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732626843, ; 403: Xamarin.AndroidX.Activity => 0xa2e0939b => 199
	i32 2735172069, ; 404: System.Threading.Channels => 0xa30769e5 => 139
	i32 2737747696, ; 405: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 205
	i32 2740948882, ; 406: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2748088231, ; 407: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 408: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 299
	i32 2758225723, ; 409: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 190
	i32 2764765095, ; 410: Microsoft.Maui.dll => 0xa4caf7a7 => 191
	i32 2765824710, ; 411: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 412: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 271
	i32 2778768386, ; 413: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 262
	i32 2779977773, ; 414: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 250
	i32 2785988530, ; 415: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 305
	i32 2788224221, ; 416: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 228
	i32 2801831435, ; 417: Microsoft.Maui.Graphics => 0xa7008e0b => 193
	i32 2803228030, ; 418: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2806116107, ; 419: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 284
	i32 2810250172, ; 420: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 215
	i32 2819470561, ; 421: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 422: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 423: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 250
	i32 2824502124, ; 424: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2831556043, ; 425: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 297
	i32 2838993487, ; 426: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 239
	i32 2849599387, ; 427: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2853208004, ; 428: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 262
	i32 2855708567, ; 429: Xamarin.AndroidX.Transition => 0xaa36a797 => 258
	i32 2861098320, ; 430: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 431: Microsoft.Maui.Essentials => 0xaa8a4878 => 192
	i32 2870099610, ; 432: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 200
	i32 2875164099, ; 433: Jsr305Binding.dll => 0xab5f85c3 => 267
	i32 2875220617, ; 434: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2884993177, ; 435: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 226
	i32 2887636118, ; 436: System.Net.dll => 0xac1dd496 => 81
	i32 2899753641, ; 437: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 438: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 439: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 440: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 441: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2916838712, ; 442: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 263
	i32 2919462931, ; 443: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 444: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 202
	i32 2936416060, ; 445: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 446: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 447: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2959614098, ; 448: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 449: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2971004615, ; 450: Microsoft.Extensions.Options.ConfigurationExtensions.dll => 0xb115eec7 => 186
	i32 2972252294, ; 451: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978675010, ; 452: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 222
	i32 2987532451, ; 453: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 253
	i32 2996846495, ; 454: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 235
	i32 3016983068, ; 455: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 255
	i32 3020703001, ; 456: Microsoft.Extensions.Diagnostics => 0xb40c4519 => 179
	i32 3023353419, ; 457: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 458: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 230
	i32 3038032645, ; 459: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 312
	i32 3056245963, ; 460: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 252
	i32 3057625584, ; 461: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 243
	i32 3059408633, ; 462: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 463: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 464: System.Threading.Tasks => 0xb755818f => 144
	i32 3077302341, ; 465: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 290
	i32 3090735792, ; 466: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099732863, ; 467: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 468: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 469: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 470: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 471: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 472: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3147165239, ; 473: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 474: GoogleGson.dll => 0xbba64c02 => 173
	i32 3159123045, ; 475: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 476: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3178803400, ; 477: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 244
	i32 3192346100, ; 478: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 479: System.Web => 0xbe592c0c => 153
	i32 3204380047, ; 480: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 481: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 482: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 221
	i32 3220365878, ; 483: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 484: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3251039220, ; 485: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3258312781, ; 486: Xamarin.AndroidX.CardView => 0xc235e84d => 209
	i32 3265493905, ; 487: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 488: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 489: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 490: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 491: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 492: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 493: System.Text.Encoding => 0xc4a8494a => 135
	i32 3303498502, ; 494: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 495: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 285
	i32 3316684772, ; 496: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 497: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 219
	i32 3317144872, ; 498: System.Data => 0xc5b79d28 => 24
	i32 3340431453, ; 499: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 207
	i32 3345895724, ; 500: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 248
	i32 3346324047, ; 501: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 245
	i32 3357674450, ; 502: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 302
	i32 3358260929, ; 503: System.Text.Json => 0xc82afec1 => 137
	i32 3362336904, ; 504: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 200
	i32 3362522851, ; 505: Xamarin.AndroidX.Core => 0xc86c06e3 => 216
	i32 3366347497, ; 506: Java.Interop => 0xc8a662e9 => 168
	i32 3374999561, ; 507: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 249
	i32 3381016424, ; 508: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 281
	i32 3395150330, ; 509: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 510: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 511: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 220
	i32 3421170118, ; 512: Microsoft.Extensions.Configuration.Binder => 0xcbeae9c6 => 176
	i32 3428513518, ; 513: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 177
	i32 3429136800, ; 514: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 515: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 516: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 223
	i32 3445260447, ; 517: System.Formats.Tar => 0xcd5a809f => 39
	i32 3452344032, ; 518: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 188
	i32 3463511458, ; 519: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 289
	i32 3471940407, ; 520: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 521: Mono.Android => 0xcf3163e6 => 171
	i32 3479583265, ; 522: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 302
	i32 3484440000, ; 523: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 301
	i32 3485117614, ; 524: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 525: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 526: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 212
	i32 3509114376, ; 527: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 528: System.Security.dll => 0xd1854eb4 => 130
	i32 3530912306, ; 529: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 530: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3560100363, ; 531: System.Threading.Timer => 0xd432d20b => 147
	i32 3570554715, ; 532: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3580758918, ; 533: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 309
	i32 3597029428, ; 534: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 198
	i32 3598340787, ; 535: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3608519521, ; 536: System.Linq.dll => 0xd715a361 => 61
	i32 3624195450, ; 537: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 538: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 247
	i32 3633644679, ; 539: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 202
	i32 3638274909, ; 540: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 541: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 233
	i32 3643446276, ; 542: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 306
	i32 3643854240, ; 543: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 244
	i32 3645089577, ; 544: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 545: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 175
	i32 3660523487, ; 546: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3672681054, ; 547: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3682565725, ; 548: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 208
	i32 3684561358, ; 549: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 212
	i32 3697841164, ; 550: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 311
	i32 3700866549, ; 551: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3706696989, ; 552: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 217
	i32 3716563718, ; 553: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 554: Xamarin.AndroidX.Annotation => 0xdda814c6 => 201
	i32 3724971120, ; 555: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 243
	i32 3732100267, ; 556: System.Net.NameResolution => 0xde7354ab => 67
	i32 3737834244, ; 557: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 558: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 559: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3786282454, ; 560: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 210
	i32 3792276235, ; 561: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 562: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 188
	i32 3802395368, ; 563: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3819260425, ; 564: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 565: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 566: System.Numerics.dll => 0xe4436460 => 83
	i32 3841636137, ; 567: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 178
	i32 3844307129, ; 568: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 569: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 570: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 571: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 572: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3885497537, ; 573: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 574: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 258
	i32 3888767677, ; 575: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 248
	i32 3889960447, ; 576: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 310
	i32 3896106733, ; 577: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 578: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 216
	i32 3901907137, ; 579: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920810846, ; 580: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 581: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 261
	i32 3928044579, ; 582: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 583: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 584: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 246
	i32 3945713374, ; 585: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 586: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3955647286, ; 587: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 204
	i32 3959773229, ; 588: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 235
	i32 3980434154, ; 589: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 305
	i32 3987592930, ; 590: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 287
	i32 4003436829, ; 591: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015948917, ; 592: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 203
	i32 4025784931, ; 593: System.Memory => 0xeff49a63 => 62
	i32 4046471985, ; 594: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 190
	i32 4054681211, ; 595: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4068434129, ; 596: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 597: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4094352644, ; 598: Microsoft.Maui.Essentials.dll => 0xf40add04 => 192
	i32 4099507663, ; 599: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 600: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 601: Xamarin.AndroidX.Emoji2 => 0xf479582c => 224
	i32 4102112229, ; 602: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 300
	i32 4125707920, ; 603: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 295
	i32 4126470640, ; 604: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 177
	i32 4127667938, ; 605: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 606: System.AppContext => 0xf6318da0 => 6
	i32 4144683026, ; 607: Refit.dll => 0xf70ad812 => 194
	i32 4147896353, ; 608: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 609: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 307
	i32 4151237749, ; 610: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 611: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 612: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 613: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 614: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 615: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 240
	i32 4185676441, ; 616: System.Security => 0xf97c5a99 => 130
	i32 4196529839, ; 617: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 618: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4256097574, ; 619: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 217
	i32 4258378803, ; 620: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 239
	i32 4260525087, ; 621: System.Buffers => 0xfdf2741f => 7
	i32 4271975918, ; 622: Microsoft.Maui.Controls.dll => 0xfea12dee => 189
	i32 4274976490, ; 623: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 624: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 240
	i32 4294763496 ; 625: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 226
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [626 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 236, ; 3
	i32 270, ; 4
	i32 48, ; 5
	i32 80, ; 6
	i32 145, ; 7
	i32 30, ; 8
	i32 311, ; 9
	i32 124, ; 10
	i32 193, ; 11
	i32 102, ; 12
	i32 180, ; 13
	i32 254, ; 14
	i32 107, ; 15
	i32 254, ; 16
	i32 139, ; 17
	i32 274, ; 18
	i32 77, ; 19
	i32 124, ; 20
	i32 13, ; 21
	i32 210, ; 22
	i32 132, ; 23
	i32 256, ; 24
	i32 151, ; 25
	i32 308, ; 26
	i32 309, ; 27
	i32 18, ; 28
	i32 208, ; 29
	i32 26, ; 30
	i32 179, ; 31
	i32 230, ; 32
	i32 1, ; 33
	i32 59, ; 34
	i32 42, ; 35
	i32 91, ; 36
	i32 213, ; 37
	i32 147, ; 38
	i32 232, ; 39
	i32 229, ; 40
	i32 280, ; 41
	i32 54, ; 42
	i32 181, ; 43
	i32 69, ; 44
	i32 308, ; 45
	i32 199, ; 46
	i32 83, ; 47
	i32 293, ; 48
	i32 231, ; 49
	i32 292, ; 50
	i32 131, ; 51
	i32 55, ; 52
	i32 149, ; 53
	i32 74, ; 54
	i32 145, ; 55
	i32 62, ; 56
	i32 146, ; 57
	i32 312, ; 58
	i32 165, ; 59
	i32 304, ; 60
	i32 214, ; 61
	i32 12, ; 62
	i32 227, ; 63
	i32 125, ; 64
	i32 152, ; 65
	i32 113, ; 66
	i32 166, ; 67
	i32 164, ; 68
	i32 229, ; 69
	i32 242, ; 70
	i32 84, ; 71
	i32 291, ; 72
	i32 285, ; 73
	i32 187, ; 74
	i32 150, ; 75
	i32 274, ; 76
	i32 60, ; 77
	i32 182, ; 78
	i32 51, ; 79
	i32 103, ; 80
	i32 114, ; 81
	i32 40, ; 82
	i32 267, ; 83
	i32 265, ; 84
	i32 120, ; 85
	i32 299, ; 86
	i32 52, ; 87
	i32 44, ; 88
	i32 119, ; 89
	i32 219, ; 90
	i32 297, ; 91
	i32 225, ; 92
	i32 81, ; 93
	i32 136, ; 94
	i32 261, ; 95
	i32 206, ; 96
	i32 8, ; 97
	i32 73, ; 98
	i32 279, ; 99
	i32 155, ; 100
	i32 276, ; 101
	i32 154, ; 102
	i32 92, ; 103
	i32 271, ; 104
	i32 45, ; 105
	i32 294, ; 106
	i32 282, ; 107
	i32 275, ; 108
	i32 109, ; 109
	i32 186, ; 110
	i32 129, ; 111
	i32 25, ; 112
	i32 196, ; 113
	i32 72, ; 114
	i32 55, ; 115
	i32 46, ; 116
	i32 303, ; 117
	i32 185, ; 118
	i32 220, ; 119
	i32 22, ; 120
	i32 234, ; 121
	i32 86, ; 122
	i32 43, ; 123
	i32 160, ; 124
	i32 71, ; 125
	i32 247, ; 126
	i32 3, ; 127
	i32 42, ; 128
	i32 63, ; 129
	i32 16, ; 130
	i32 194, ; 131
	i32 53, ; 132
	i32 306, ; 133
	i32 270, ; 134
	i32 105, ; 135
	i32 275, ; 136
	i32 268, ; 137
	i32 231, ; 138
	i32 34, ; 139
	i32 158, ; 140
	i32 85, ; 141
	i32 32, ; 142
	i32 12, ; 143
	i32 51, ; 144
	i32 56, ; 145
	i32 251, ; 146
	i32 36, ; 147
	i32 178, ; 148
	i32 281, ; 149
	i32 269, ; 150
	i32 204, ; 151
	i32 35, ; 152
	i32 58, ; 153
	i32 180, ; 154
	i32 238, ; 155
	i32 173, ; 156
	i32 17, ; 157
	i32 272, ; 158
	i32 164, ; 159
	i32 294, ; 160
	i32 237, ; 161
	i32 184, ; 162
	i32 264, ; 163
	i32 300, ; 164
	i32 153, ; 165
	i32 260, ; 166
	i32 245, ; 167
	i32 298, ; 168
	i32 206, ; 169
	i32 29, ; 170
	i32 0, ; 171
	i32 52, ; 172
	i32 296, ; 173
	i32 265, ; 174
	i32 5, ; 175
	i32 280, ; 176
	i32 255, ; 177
	i32 259, ; 178
	i32 211, ; 179
	i32 276, ; 180
	i32 203, ; 181
	i32 222, ; 182
	i32 85, ; 183
	i32 264, ; 184
	i32 61, ; 185
	i32 112, ; 186
	i32 57, ; 187
	i32 310, ; 188
	i32 251, ; 189
	i32 99, ; 190
	i32 19, ; 191
	i32 215, ; 192
	i32 111, ; 193
	i32 101, ; 194
	i32 102, ; 195
	i32 278, ; 196
	i32 104, ; 197
	i32 268, ; 198
	i32 71, ; 199
	i32 38, ; 200
	i32 32, ; 201
	i32 103, ; 202
	i32 73, ; 203
	i32 284, ; 204
	i32 9, ; 205
	i32 123, ; 206
	i32 46, ; 207
	i32 205, ; 208
	i32 187, ; 209
	i32 9, ; 210
	i32 43, ; 211
	i32 4, ; 212
	i32 252, ; 213
	i32 288, ; 214
	i32 181, ; 215
	i32 283, ; 216
	i32 31, ; 217
	i32 138, ; 218
	i32 92, ; 219
	i32 93, ; 220
	i32 303, ; 221
	i32 49, ; 222
	i32 141, ; 223
	i32 112, ; 224
	i32 140, ; 225
	i32 221, ; 226
	i32 115, ; 227
	i32 269, ; 228
	i32 157, ; 229
	i32 76, ; 230
	i32 79, ; 231
	i32 241, ; 232
	i32 37, ; 233
	i32 263, ; 234
	i32 225, ; 235
	i32 218, ; 236
	i32 64, ; 237
	i32 138, ; 238
	i32 15, ; 239
	i32 116, ; 240
	i32 257, ; 241
	i32 266, ; 242
	i32 213, ; 243
	i32 48, ; 244
	i32 70, ; 245
	i32 80, ; 246
	i32 126, ; 247
	i32 94, ; 248
	i32 121, ; 249
	i32 273, ; 250
	i32 26, ; 251
	i32 234, ; 252
	i32 97, ; 253
	i32 28, ; 254
	i32 209, ; 255
	i32 301, ; 256
	i32 279, ; 257
	i32 149, ; 258
	i32 169, ; 259
	i32 4, ; 260
	i32 98, ; 261
	i32 33, ; 262
	i32 93, ; 263
	i32 256, ; 264
	i32 182, ; 265
	i32 21, ; 266
	i32 41, ; 267
	i32 170, ; 268
	i32 295, ; 269
	i32 227, ; 270
	i32 287, ; 271
	i32 241, ; 272
	i32 272, ; 273
	i32 266, ; 274
	i32 246, ; 275
	i32 2, ; 276
	i32 134, ; 277
	i32 111, ; 278
	i32 183, ; 279
	i32 307, ; 280
	i32 196, ; 281
	i32 304, ; 282
	i32 58, ; 283
	i32 95, ; 284
	i32 286, ; 285
	i32 39, ; 286
	i32 207, ; 287
	i32 25, ; 288
	i32 94, ; 289
	i32 89, ; 290
	i32 99, ; 291
	i32 0, ; 292
	i32 10, ; 293
	i32 87, ; 294
	i32 100, ; 295
	i32 253, ; 296
	i32 174, ; 297
	i32 273, ; 298
	i32 198, ; 299
	i32 283, ; 300
	i32 7, ; 301
	i32 238, ; 302
	i32 278, ; 303
	i32 195, ; 304
	i32 88, ; 305
	i32 176, ; 306
	i32 233, ; 307
	i32 154, ; 308
	i32 282, ; 309
	i32 33, ; 310
	i32 116, ; 311
	i32 82, ; 312
	i32 20, ; 313
	i32 11, ; 314
	i32 162, ; 315
	i32 3, ; 316
	i32 191, ; 317
	i32 290, ; 318
	i32 185, ; 319
	i32 183, ; 320
	i32 84, ; 321
	i32 277, ; 322
	i32 64, ; 323
	i32 292, ; 324
	i32 260, ; 325
	i32 143, ; 326
	i32 242, ; 327
	i32 157, ; 328
	i32 41, ; 329
	i32 117, ; 330
	i32 175, ; 331
	i32 197, ; 332
	i32 286, ; 333
	i32 249, ; 334
	i32 131, ; 335
	i32 75, ; 336
	i32 66, ; 337
	i32 296, ; 338
	i32 172, ; 339
	i32 201, ; 340
	i32 143, ; 341
	i32 106, ; 342
	i32 151, ; 343
	i32 70, ; 344
	i32 156, ; 345
	i32 174, ; 346
	i32 121, ; 347
	i32 127, ; 348
	i32 291, ; 349
	i32 152, ; 350
	i32 224, ; 351
	i32 141, ; 352
	i32 211, ; 353
	i32 288, ; 354
	i32 20, ; 355
	i32 14, ; 356
	i32 135, ; 357
	i32 75, ; 358
	i32 59, ; 359
	i32 214, ; 360
	i32 167, ; 361
	i32 168, ; 362
	i32 189, ; 363
	i32 15, ; 364
	i32 74, ; 365
	i32 6, ; 366
	i32 23, ; 367
	i32 236, ; 368
	i32 195, ; 369
	i32 91, ; 370
	i32 289, ; 371
	i32 1, ; 372
	i32 136, ; 373
	i32 237, ; 374
	i32 259, ; 375
	i32 134, ; 376
	i32 69, ; 377
	i32 146, ; 378
	i32 298, ; 379
	i32 277, ; 380
	i32 228, ; 381
	i32 184, ; 382
	i32 88, ; 383
	i32 96, ; 384
	i32 218, ; 385
	i32 223, ; 386
	i32 293, ; 387
	i32 31, ; 388
	i32 45, ; 389
	i32 232, ; 390
	i32 197, ; 391
	i32 109, ; 392
	i32 158, ; 393
	i32 35, ; 394
	i32 22, ; 395
	i32 114, ; 396
	i32 57, ; 397
	i32 257, ; 398
	i32 144, ; 399
	i32 118, ; 400
	i32 120, ; 401
	i32 110, ; 402
	i32 199, ; 403
	i32 139, ; 404
	i32 205, ; 405
	i32 54, ; 406
	i32 105, ; 407
	i32 299, ; 408
	i32 190, ; 409
	i32 191, ; 410
	i32 133, ; 411
	i32 271, ; 412
	i32 262, ; 413
	i32 250, ; 414
	i32 305, ; 415
	i32 228, ; 416
	i32 193, ; 417
	i32 159, ; 418
	i32 284, ; 419
	i32 215, ; 420
	i32 163, ; 421
	i32 132, ; 422
	i32 250, ; 423
	i32 161, ; 424
	i32 297, ; 425
	i32 239, ; 426
	i32 140, ; 427
	i32 262, ; 428
	i32 258, ; 429
	i32 169, ; 430
	i32 192, ; 431
	i32 200, ; 432
	i32 267, ; 433
	i32 40, ; 434
	i32 226, ; 435
	i32 81, ; 436
	i32 56, ; 437
	i32 37, ; 438
	i32 97, ; 439
	i32 166, ; 440
	i32 172, ; 441
	i32 263, ; 442
	i32 82, ; 443
	i32 202, ; 444
	i32 98, ; 445
	i32 30, ; 446
	i32 159, ; 447
	i32 18, ; 448
	i32 127, ; 449
	i32 186, ; 450
	i32 119, ; 451
	i32 222, ; 452
	i32 253, ; 453
	i32 235, ; 454
	i32 255, ; 455
	i32 179, ; 456
	i32 165, ; 457
	i32 230, ; 458
	i32 312, ; 459
	i32 252, ; 460
	i32 243, ; 461
	i32 170, ; 462
	i32 16, ; 463
	i32 144, ; 464
	i32 290, ; 465
	i32 125, ; 466
	i32 118, ; 467
	i32 38, ; 468
	i32 115, ; 469
	i32 47, ; 470
	i32 142, ; 471
	i32 117, ; 472
	i32 34, ; 473
	i32 173, ; 474
	i32 95, ; 475
	i32 53, ; 476
	i32 244, ; 477
	i32 129, ; 478
	i32 153, ; 479
	i32 24, ; 480
	i32 161, ; 481
	i32 221, ; 482
	i32 148, ; 483
	i32 104, ; 484
	i32 89, ; 485
	i32 209, ; 486
	i32 60, ; 487
	i32 142, ; 488
	i32 100, ; 489
	i32 5, ; 490
	i32 13, ; 491
	i32 122, ; 492
	i32 135, ; 493
	i32 28, ; 494
	i32 285, ; 495
	i32 72, ; 496
	i32 219, ; 497
	i32 24, ; 498
	i32 207, ; 499
	i32 248, ; 500
	i32 245, ; 501
	i32 302, ; 502
	i32 137, ; 503
	i32 200, ; 504
	i32 216, ; 505
	i32 168, ; 506
	i32 249, ; 507
	i32 281, ; 508
	i32 101, ; 509
	i32 123, ; 510
	i32 220, ; 511
	i32 176, ; 512
	i32 177, ; 513
	i32 163, ; 514
	i32 167, ; 515
	i32 223, ; 516
	i32 39, ; 517
	i32 188, ; 518
	i32 289, ; 519
	i32 17, ; 520
	i32 171, ; 521
	i32 302, ; 522
	i32 301, ; 523
	i32 137, ; 524
	i32 150, ; 525
	i32 212, ; 526
	i32 155, ; 527
	i32 130, ; 528
	i32 19, ; 529
	i32 65, ; 530
	i32 147, ; 531
	i32 47, ; 532
	i32 309, ; 533
	i32 198, ; 534
	i32 79, ; 535
	i32 61, ; 536
	i32 106, ; 537
	i32 247, ; 538
	i32 202, ; 539
	i32 49, ; 540
	i32 233, ; 541
	i32 306, ; 542
	i32 244, ; 543
	i32 14, ; 544
	i32 175, ; 545
	i32 68, ; 546
	i32 171, ; 547
	i32 208, ; 548
	i32 212, ; 549
	i32 311, ; 550
	i32 78, ; 551
	i32 217, ; 552
	i32 108, ; 553
	i32 201, ; 554
	i32 243, ; 555
	i32 67, ; 556
	i32 63, ; 557
	i32 27, ; 558
	i32 160, ; 559
	i32 210, ; 560
	i32 10, ; 561
	i32 188, ; 562
	i32 11, ; 563
	i32 78, ; 564
	i32 126, ; 565
	i32 83, ; 566
	i32 178, ; 567
	i32 66, ; 568
	i32 107, ; 569
	i32 65, ; 570
	i32 128, ; 571
	i32 122, ; 572
	i32 77, ; 573
	i32 258, ; 574
	i32 248, ; 575
	i32 310, ; 576
	i32 8, ; 577
	i32 216, ; 578
	i32 2, ; 579
	i32 44, ; 580
	i32 261, ; 581
	i32 156, ; 582
	i32 128, ; 583
	i32 246, ; 584
	i32 23, ; 585
	i32 133, ; 586
	i32 204, ; 587
	i32 235, ; 588
	i32 305, ; 589
	i32 287, ; 590
	i32 29, ; 591
	i32 203, ; 592
	i32 62, ; 593
	i32 190, ; 594
	i32 90, ; 595
	i32 87, ; 596
	i32 148, ; 597
	i32 192, ; 598
	i32 36, ; 599
	i32 86, ; 600
	i32 224, ; 601
	i32 300, ; 602
	i32 295, ; 603
	i32 177, ; 604
	i32 50, ; 605
	i32 6, ; 606
	i32 194, ; 607
	i32 90, ; 608
	i32 307, ; 609
	i32 21, ; 610
	i32 162, ; 611
	i32 96, ; 612
	i32 50, ; 613
	i32 113, ; 614
	i32 240, ; 615
	i32 130, ; 616
	i32 76, ; 617
	i32 27, ; 618
	i32 217, ; 619
	i32 239, ; 620
	i32 7, ; 621
	i32 189, ; 622
	i32 110, ; 623
	i32 240, ; 624
	i32 226 ; 625
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ df9aaf29a52042a4fbf800daf2f3a38964b9e958"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}