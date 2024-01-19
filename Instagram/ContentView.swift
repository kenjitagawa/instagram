//
//  ContentView.swift
//  Instagram
//
//  Created by Kenji Tagawa on 2024-01-18.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack(spacing: 0.0) {
            Header()
            
            ScrollView(.vertical, showsIndicators: false){
                Stories()
                
                Divider()
                
                Post(caption: "Hello world!")
                Post(image: "profile_9",
                     caption: "Sheesh",
                     username: "Patate")
            }
            
            NavBar()
            
        }
    }
}

#Preview {
    ContentView()
}

// Components
struct Header: View {
    var body: some View {
        HStack {
            
            Image("logo")
                .frame(width: 104, height: 30)
            
            
            Image("down_arrow")
                .padding(.bottom, 15)
            
            Spacer()
            
            HStack (spacing: 15) {
                Image("heart_blank")
                Image("messages")
                Image("plus")
            }
            
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 30)
    }
}

struct Story: View {
    var image: String = "profile"
    var name: String = "Kenji"
    var accountHolder: Bool = false
    
    var body: some View {
        VStack {
            VStack {
                
                Image(image)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .cornerRadius(50)
                
            }
            .overlay (Group {
                Circle()
                    .stroke(LinearGradient(colors: [.red, .purple, .red, .orange, .yellow, .orange], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2.3)
                    .frame(width: 68, height: 68)
                if accountHolder {
                    Image("Button")
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .bottomTrailing)
                }
            })
            .frame(width: 70, height: 70)
            Text(name)
                .font(.caption)
        }
    }
}

struct Stories: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack (spacing: 15) {
                Story(accountHolder: true)
                Story(image: "profile_2", name: "User 2")
                Story(image: "profile_3", name: "User 3")
                Story(image: "profile_4", name: "User 4")
                Story(image: "profile_5", name: "User 5")
                Story(image: "profile_6", name: "User 6")
                Story(image: "profile_7", name: "User 7")
                Story(image: "profile_8", name: "User 8")
                Story(image: "profile_9", name: "User 9")
            }
            .padding(.horizontal, 8)
        }
        .padding(.vertical, 10)
    }
}

struct PostHeader: View {
    var body: some View {
        HStack {
            HStack {
                Image("profile")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .cornerRadius(50)
                
                Text("Kenji")
                    .font(.caption)
                    .bold()
                
            }
            
            Spacer()
            
            Image("more")
        }
        .padding(.vertical, 15)
        .padding(.horizontal, 12)
    }
}

struct PostContent: View {
    var image: String = "profile"
    
    var body: some View {
        VStack (spacing: 0.0) {
            VStack {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
//           TODO: Add tagged
//            .overlay (
//                Image("Tags")
//                    .resizable()
//                    .frame(alignment: .bottomLeading)
//            )
            
            HStack {
                HStack (spacing: 10) {
                    Image("heart_blank")
                    Image("comment")
                    Image("send")
                }
                
                Spacer()
                
                Image("save")
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
        }
    }
}

struct Post: View {
    var image: String = "profile"
    var caption: String = "Woof"
    var username: String = "Username"
    
    
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            PostHeader()
            PostContent()
            
            Text("Liked by User and others")
                .font(.footnote)
                .padding(.horizontal, 12)
            
            HStack {
                
                Text(username)
                    .font(.caption)
                    .bold()
                
                Text(caption)
                    .font(.footnote)

                
            }.padding(.horizontal, 12)
            
            HStack {
                HStack(spacing: 7.0){
                    Image("profile")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .cornerRadius(50)
                    
                    Text("Add a comment...")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                HStack {
                    Text("❤️")
                    Text("😂")
                    Image(systemName: "plus.circle")
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 9)
        }
    }
}

struct NavBar: View {
    var body: some View {
        VStack(spacing: 0.0) {
            Divider()
            
            HStack{
                Image("home")
                Spacer()
                Image("search")
                Spacer()
                Image("reels")
                Spacer()
                Image("shop")
                Spacer()
                Image("profile")
                    .resizable()
                    .frame(width: 21, height: 21)
                    .cornerRadius(50)
            }
            .padding(.horizontal, 25)
            .padding(.top, 10)
            
        }
    }
}
