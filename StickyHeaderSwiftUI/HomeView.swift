//
//  ContentView.swift
//  StickyHeaderSwiftUI
//
//  Created by Brandon Wood on 12/9/22.
//

import SwiftUI

struct HomeView: View {
    
    @State var scale = 1.0

    
    var body: some View {
        
        
        ScrollView {
            
            stickyHeader
            
            
            content
                .zIndex(-100)
            
        }
        .coordinateSpace(name: "SCROLL")
    }
}


extension HomeView {
    
    
    func getHeaderHeight(height: CGFloat) -> CGFloat {
        
        let minHeight : CGFloat = 100
        
        if (height < minHeight) {
            return minHeight
        } else {
            return height
        }
        
    }
    

    func getHeaderScale(scale: CGFloat) -> CGFloat {
        
        let minScale = 0.7
        if (scale < minScale) {
            return minScale
        }
        return scale
        
    }
    
    
    var stickyHeader : some View {
        
        GeometryReader { geo in
            let height : CGFloat = geo.size.height
            let minY = geo.frame(in: .named("SCROLL")).minY
            
            ZStack {
                Color.green
                Text("\(height + minY)").font(.largeTitle)
                    .scaleEffect( getHeaderScale(scale: (height + minY)/height ))
            }
            .frame(height: getHeaderHeight(height: height + minY))
            .offset(y: -minY)
            
        }
        .frame(height: 200)
        
        
        
    }
    
    
    var content : some View {
        
        ForEach (1..<100) { number in
            Text("\(number)")
                .padding(.bottom, 20)
        }
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
