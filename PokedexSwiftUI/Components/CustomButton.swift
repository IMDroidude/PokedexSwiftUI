//
//  CustomButton.swift
//  PokedexSwiftUI
//
//  Created by Macbook on 08/07/2024.
//

import SwiftUI

internal struct CommonButton<Content: View>: View {
    var isPrimary : Bool = true
    var isDisabled: Bool = false
    var title: String?
    var content: Content
    var action: () -> Void
    
    var body: some View {
        let backgroundColor: Color = isDisabled ? Color("disabledBackgroundColor") : (isPrimary ? Color("primaryBackgroundColor") : Color("secondaryBackgroundColor"))
        let foregroundColor: Color = isDisabled ? Color("disabledForegroundColor") : (isPrimary ? Color("primaryForegroundColor") : Color("secondaryForegroundColor"))
        Button(action: action) {
            HStack {
                content
            }
            .frame(maxWidth: .infinity,
                   minHeight: Dimensions.buttonHeight) // Ensure HStack takes full width and specified height
            .background(Color(backgroundColor)) // Default background color
            .foregroundColor(foregroundColor) // Default text color
            .cornerRadius(Dimensions.buttonCornerRadius) // Default corner radius
        }
    }
}

struct CommonTextButton : View {
    var isPrimary : Bool = true
    var isDisabled: Bool = false
    var title: String
    var action: () -> Void
    var body: some View {
        CommonButton(isPrimary : isPrimary, isDisabled : isDisabled,title: title, content: HStack {
            Text(title).font(.headline)
        }, action: action)
    }
}

struct CommonIconButton: View {
    let icon: String
    var isPrimary: Bool = true
    var isDisabled:Bool = false
    var action: () -> Void
    
    
    var body: some View {
        CommonButton(isPrimary : isPrimary, isDisabled : isDisabled, content: HStack {
            Image(icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: Dimensions.iconWidth, height: Dimensions.iconHeight)
        }, action: action)
    
    }
}

struct CommonTextIconButton: View {
    var isPrimary : Bool = true
    var isDisabled: Bool = false
    var title: String
    var action: () -> Void
    // Add space between flag and show hide Spacer along with .leading and .trailing padding.
    
    var body: some View {
        CommonButton(isPrimary : isPrimary, isDisabled : isDisabled,title: title, content: HStack {
            Text(title)
                .font(.headline)
                .padding(.leading, 16)
            Spacer()
            Image(systemName: "chevron.right")
                .font(.headline)
                .padding(.trailing, 16)
        }, action: action)
    }
}

//under maintenance...
struct CommonIconTextlButton: View {
    var isPrimary : Bool = true
    var isDisabled: Bool = false
    var title: String
    let icon: Image
    var action: () -> Void
    
    var body: some View {
        CommonButton(isPrimary : isPrimary, isDisabled : isDisabled,title: title, content: HStack {
            icon
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: Dimensions.iconWidth, height: Dimensions.iconHeight)
                .accentColor(isPrimary ? .white : .black)
            
            Text(title)
                .font(.headline)
                ///.padding(.leading, 16)
        }, action: action)
    }
}



#Preview {
    VStack{
        CommonTextButton(title: "Primary Btn", action: {})
        CommonTextButton(isPrimary: false, title: "Secondary Btn", action: {})
        CommonTextButton(isDisabled: true, title: "Disable Btn", action: {})
        
        CommonTextIconButton(title: "Primary Detail", action: {})
        HStack {
            CommonTextIconButton(isPrimary : false,title: "Secondary Dtl", action: {})
            CommonTextIconButton(isDisabled: true, title: "Disabled Dtl", action: {})
        }
        
        CommonIconTextlButton(title: "Icon At Start",icon: Image("leftArrow"), action: {})
        
        HStack {
            CommonIconTextlButton(isPrimary : false,title: "Secondary",icon: Image("leftArrow"), action: {})
            CommonIconTextlButton(isDisabled: true, title: "Disabled",icon: Image("leftArrow"), action: {})
        }
        
        HStack{
            CommonIconButton(icon: "fingerprint", action: {})
            CommonIconButton(icon: "fingerprint", isPrimary:false, action: {})
            CommonIconButton(icon: "fingerprint", isDisabled: true, action: {})
        }
    }.padding()
}
