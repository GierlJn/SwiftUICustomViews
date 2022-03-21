//
//  AnimatedListButton.swift
//  SwiftUICustomViews
//
//  Created by Julian Gierl on 21.03.22.
//
import SwiftUI


struct AnimatedListButton: View {
    
    @State private var isRotating = false
    @State private var isHidden = false
    
    var body: some View {
      ZStack{
        VStack(spacing: 14){
            
            Rectangle() // top
                .frame(width: 64, height: 10)
                .cornerRadius(4)
                .rotationEffect(.degrees(isRotating ? 0 : 0), anchor: .leading)
                .offset(x: 0, y: isRotating ? 10 : 0)
            
            Rectangle() // middle
                .frame(width: 64, height: 10)
                .cornerRadius(4)
                .scaleEffect(isHidden ? 0 : 1, anchor: isHidden ? .trailing: .leading)
                .opacity(isHidden ? 0 : 1)
                .rotationEffect(.degrees(isRotating ? 90: 0) )
            
            Rectangle() // bottom
                .frame(width: 64, height: 10)
                .cornerRadius(4)
                .rotationEffect(.degrees(isRotating ? 0 : 0), anchor: .leading)
                .offset(x: 0, y: isRotating ? -10 : 0)
        }
        
            
        
      }
        
        .onTapGesture {
            withAnimation(.interpolatingSpring(stiffness: 300, damping: 15)){
                isRotating.toggle()
                isHidden.toggle()
            }
        }
        
    }
}

struct AnimatedListButton_Previews: PreviewProvider {
    static var previews: some View {
      AnimatedListButton()
            .preferredColorScheme(.dark)
    }
}
