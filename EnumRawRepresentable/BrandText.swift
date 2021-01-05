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

enum BrandUse: CaseIterable, Identifiable {
    var id: UUID {
        return UUID()
    }
    case primary
    case secondary
    case tertiary
    var description: String {
        return "\(self)"
    }
    var color: Color {
        return self.rawValue
    }
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
                assertionFailure("Don't init BrandUse with an unknown rawValue!")
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
        VStack() {
            ForEach(BrandUse.allCases) {
                use in
                BrandText(title: use.description, usage: use)
                
            }.padding(10)
        }.previewLayout(.sizeThatFits)
        
    }
}

struct BrandText: View {
    let title: String
    let usage: BrandUse
    var body: some View {
        Text(title)
            .fontWeight(.bold)
            .foregroundColor(Color.primary)
            .padding()
            .background(usage.color)
            .clipShape(Rectangle())
            .cornerRadius(15.0)
    }
}
