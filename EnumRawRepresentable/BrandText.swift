//
//  BrandText.swift
//  EnumRawRepresentable
//
//  Created by Bill Morrison on 1/4/21.
//

import SwiftUI

extension Color {
    static var brandPrimary: Color {
        Color("primary")
    }
    static var brandSecondary: Color {
        Color("secondary")
    }
    static var brandTertiary: Color {
        Color("tertiary")
    }
}

enum BrandUse {
    case primary
    case secondary
    case tertiary
}

/// see: https://oleb.net/blog/2016/11/rawrepresentable/
extension BrandUse: RawRepresentable {
    
    typealias RawValue = Color
    
    init?(rawValue: RawValue) {
        switch rawValue {
            case .brandPrimary:
                self = .primary
            case .brandSecondary:
                self = .secondary
            case .brandTertiary:
                self = .tertiary
            default:
                return nil
        }
    }
    
    var rawValue: RawValue {
        switch self {
            case .primary:
                return .brandPrimary
            case .secondary:
                return .brandSecondary
            case .tertiary:
                return .brandTertiary
        }
    }
}

struct BrandText_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 10) {
            BrandText(title: "Primary", use: .primary).padding()
            BrandText(title: "Secondary", use: .secondary).padding()
            BrandText(title: "Tertiary", use: .tertiary)
                .padding()
        }.previewLayout(.sizeThatFits)
        
    }
}

struct BrandText: View {
    let title: String
    let use: BrandUse
    var body: some View {
        Text(title)
            .fontWeight(.bold)
            .foregroundColor(.primary)
            .padding()
            .background(use.rawValue)
    }
}
