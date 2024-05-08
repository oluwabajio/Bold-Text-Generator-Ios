

import SwiftUI
import GoogleMobileAds
import AppTrackingTransparency

struct ContentView: View {
    @State private var enteredWord = ""

    @State private var showingAlert = false
    @State private var alertMessage = "Text Copied Successfully"
    @FocusState var focused: Bool?
    
    let characterLists = [
    ["𝐚", "𝐛", "𝐜", "𝐝", "𝐞", "𝐟", "𝐠", "𝐡", "𝐢", "𝐣", "𝐤", "𝐥", "𝐦", "𝐧", "𝐨", "𝐩", "𝐪", "𝐫", "𝐬", "𝐭", "𝐮", "𝐯", "𝐰", "𝐱", "𝐲", "𝐳", "𝐀", "𝐁", "𝐂", "𝐃", "𝐄", "𝐅", "𝐆", "𝐇", "𝐈", "𝐉", "𝐊", "𝐋", "𝐌", "𝐍", "𝐎", "𝐏", "𝐐", "𝐑", "𝐒", "𝐓", "𝐔", "𝐕", "𝐖", "𝐗", "𝐘", "𝐙", "𝟎", "𝟏", "𝟐", "𝟑", "𝟒", "𝟓", "𝟔", "𝟕", "𝟖", "𝟗"],

    ["𝗮", "𝗯", "𝗰", "𝗱", "𝗲", "𝗳", "𝗴", "𝗵", "𝗶", "𝗷", "𝗸", "𝗹", "𝗺", "𝗻", "𝗼", "𝗽", "𝗾", "𝗿", "𝘀", "𝘁", "𝘂", "𝘃", "𝘄", "𝘅", "𝘆", "𝘇", "𝗔", "𝗕", "𝗖", "𝗗", "𝗘", "𝗙", "𝗚", "𝗛", "𝗜", "𝗝", "𝗞", "𝗟", "𝗠", "𝗡", "𝗢", "𝗣", "𝗤", "𝗥", "𝗦", "𝗧", "𝗨", "𝗩", "𝗪", "𝗫", "𝗬", "𝗭", "𝟬", "𝟭", "𝟮", "𝟯", "𝟰", "𝟱", "𝟲", "𝟳", "𝟴", "𝟵"],
    
 ["𝒂", "𝒃", "𝒄", "𝒅", "𝒆", "𝒇", "𝒈", "𝒉", "𝒊", "𝒋", "𝒌", "𝒍", "𝒎", "𝒏", "𝒐", "𝒑", "𝒒", "𝒓", "𝒔", "𝒕", "𝒖", "𝒗", "𝒘", "𝒙", "𝒚", "𝒛", "𝑨", "𝑩", "𝑪", "𝑫", "𝑬", "𝑭", "𝑮", "𝑯", "𝑰", "𝑱", "𝑲", "𝑳", "𝑴", "𝑵", "𝑶", "𝑷", "𝑸", "𝑹", "𝑺", "𝑻", "𝑼", "𝑽", "𝑾", "𝑿", "𝒀", "𝒁", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"],
    
    
       [ "𝙖", "𝙗", "𝙘", "𝙙", "𝙚", "𝙛", "𝙜", "𝙝", "𝙞", "𝙟", "𝙠", "𝙡", "𝙢", "𝙣", "𝙤", "𝙥", "𝙦", "𝙧", "𝙨", "𝙩", "𝙪", "𝙫", "𝙬", "𝙭", "𝙮", "𝙯", "𝘼", "𝘽", "𝘾", "𝘿", "𝙀", "𝙁", "𝙂", "𝙃", "𝙄", "𝙅", "𝙆", "𝙇", "𝙈", "𝙉", "𝙊", "𝙋", "𝙌", "𝙍", "𝙎", "𝙏", "𝙐", "𝙑", "𝙒", "𝙓", "𝙔", "𝙕", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"   ],
    

       [ "𝖆", "𝖇", "𝖈", "𝖉", "𝖊", "𝖋", "𝖌", "𝖍", "𝖎", "𝖏", "𝖐", "𝖑", "𝖒", "𝖓", "𝖔", "𝖕", "𝖖", "𝖗", "𝖘", "𝖙", "𝖚", "𝖛", "𝖜", "𝖝", "𝖞", "𝖟", "𝕬", "𝕭", "𝕮", "𝕯", "𝕰", "𝕱", "𝕲", "𝕳", "𝕴", "𝕵", "𝕶", "𝕷", "𝕸", "𝕹", "𝕺", "𝕻", "𝕼", "𝕽", "𝕾", "𝕿", "𝖀", "𝖁", "𝖂", "𝖃", "𝖄", "𝖅", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"    ],
    
    
 [  "🅰", "🅱", "🅲", "🅳", "🅴", "🅵", "🅶", "🅷", "🅸", "🅹", "🅺", "🅻", "🅼", "🅽", "🅾", "🅿", "🆀", "🆁", "🆂", "🆃", "🆄", "🆅", "🆆", "🆇", "🆈", "🆉", "🅰", "🅱", "🅲", "🅳", "🅴", "🅵", "🅶", "🅷", "🅸", "🅹", "🅺", "🅻", "🅼", "🅽", "🅾", "🅿", "🆀", "🆁", "🆂", "🆃", "🆄", "🆅", "🆆", "🆇", "🆈", "🆉", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"
    ],
    
  [
        "🇦", "🇧", "🇨", "🇩", "🇪", "🇫", "🇬", "🇭", "🇮", "🇯", "🇰", "🇱", "🇲", "🇳", "🇴", "🇵", "🇶", "🇷", "🇸", "🇹", "🇺", "🇻", "🇼", "🇽", "🇾", "🇿", "🇦", "🇧", "🇨", "🇩", "🇪", "🇫", "🇬", "🇭", "🇮", "🇯", "🇰", "🇱", "🇲", "🇳", "🇴", "🇵", "🇶", "🇷", "🇸", "🇹", "🇺", "🇻", "🇼", "🇽", "🇾", "🇿", "0️⃣", "1️⃣", "2️⃣", "3️⃣", "4️⃣", "5️⃣", "6️⃣", "7️⃣", "8️⃣", "9️⃣"
    ],
    [
        "ⓐ", "ⓑ", "ⓒ", "ⓓ", "ⓔ", "ⓕ", "ⓖ", "ⓗ", "ⓘ", "ⓙ", "ⓚ", "ⓛ", "ⓜ", "ⓝ", "ⓞ", "ⓟ", "ⓠ", "ⓡ", "ⓢ", "ⓣ", "ⓤ", "ⓥ", "ⓦ", "ⓧ", "ⓨ", "ⓩ", "Ⓐ", "Ⓑ", "Ⓒ", "Ⓓ", "Ⓔ", "Ⓕ", "Ⓖ", "Ⓗ", "Ⓘ", "Ⓙ", "Ⓚ", "Ⓛ", "Ⓜ", "Ⓝ", "Ⓞ", "Ⓟ", "Ⓠ", "Ⓡ", "Ⓢ", "Ⓣ", "Ⓤ", "Ⓥ", "Ⓦ", "Ⓧ", "Ⓨ", "Ⓩ", "⓪", "①", "②", "③", "④", "⑤", "⑥", "⑦", "⑧", "⑨"
    ],
    
    [
        "【a】", "【b】", "【c】", "【d】", "【e】", "【f】", "【g】", "【h】", "【i】", "【j】", "【k】", "【l】", "【m】", "【n】", "【o】", "【p】", "【q】", "【r】", "【s】", "【t】", "【u】", "【v】", "【w】", "【x】", "【y】", "【z】", "【A】", "【B】", "【C】", "【D】", "【E】", "【F】", "【G】", "【H】", "【I】", "【J】", "【K】", "【L】", "【M】", "【N】", "【O】", "【P】", "【Q】", "【R】", "【S】", "【T】", "【U】", "【V】", "【W】", "【X】", "【Y】", "【Z】", "【0】", "【1】", "【2】", "【3】", "【4】", "【5】", "【6】", "【7】", "【8】", "【9】"
    ]
    ]
    
    
    var body: some View {
        VStack {
            
            TextField("Enter texts", text: $enteredWord)
                .padding()
                .focused($focused, equals: true)
                .onAppear {
                  DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                    self.focused = true
                  }
                }
            
            if enteredWord.isEmpty {
                Text("Type in any text")
            } else {
                List {
                
                    
                    ForEach(characterLists, id: \.self) { characterList in
                              VStack {
                                  HStack{
                                      Text(convertWord(word: enteredWord, list: characterList))
                                      Spacer()
                                      
                                      Image(systemName: "doc.on.doc")
                                          .onTapGesture {
                                              showingAlert = true
                                              UIPasteboard.general.string = convertWord(word: enteredWord, list: characterList)
                                              
                                          }
                                     
                                   
                                      
                                     
                                  }
                              }
                          }
                    
                }
                .padding()
            }
            
            Spacer().alert(alertMessage, isPresented: $showingAlert) {
                Button("OK", role: .cancel) { }
            }
            
            BannerView()
                        .frame(width: GADAdSizeBanner.size.width,
                               height: GADAdSizeBanner.size.height)
                        .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { _ in
                            ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in })
                        }
            
        }
        
    }
    
    func convertWord(word: String, list: [String]) -> String {
        var result = ""
        let alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        
        for char in word {
            if let position = alphabet.firstIndex(of: char) {
                let index = alphabet.distance(from: alphabet.startIndex, to: position)
                result.append(list[index])
            } else {
                result.append(char)
            }
        }
        return result.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}




struct BannerView: UIViewControllerRepresentable {
    
    let bannerView = GADBannerView(adSize: GADAdSizeBanner)
    
    func makeUIViewController(context: Context) -> UIViewController {
        
        let viewController = UIViewController()

        if isDebug() {
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716" //test
        } else {
            bannerView.adUnitID = "ca-app-pub-9295514865119591/9140033312" //real
        }
            
        bannerView.rootViewController = viewController
        viewController.view.addSubview(bannerView)
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
        bannerView.load(GADRequest())
    }
    
    // Function to check if in debug mode
       private func isDebug() -> Bool {
           var isDebug = false
           #if DEBUG
               isDebug = true
           #endif
           return isDebug
       }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
