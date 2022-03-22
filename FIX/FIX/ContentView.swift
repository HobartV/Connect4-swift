//
//  ContentView.swift
//  FIX
//
//  Created by User11 on 2022/3/20.
//

import SwiftUI


enum CircleStatus{
    case empty
    case player1
    case player2
}
enum connected{
    case yes
    case not
}


class Circless: ObservableObject{
    @Published var circleStatus : CircleStatus
    @Published var conect : connected
    
    init (status: CircleStatus, conectt: connected){
        self.circleStatus = status
        self.conect = conectt
    }
    
    
}

class Boardmodel: ObservableObject{
    @Published var circles = [Circless]()
    
    init(){
        for _ in 0...41{
            circles.append(Circless(status:.empty,conectt: .not ))
            
        }
    }
    
    func resetGame() {
        for i in 0...41{
            circles[i].circleStatus = .empty
            circles[i].conect = .not
        }
        
    }
    
    var gameOver : (CircleStatus,Bool){
        get {
            if winner == .player2{
                return (winner,true)
            }
            else if winner == .player1{
                return (winner, true)
                
            }
            else {
                for i in 0...41{
                    if circles[i].circleStatus == .empty{
                        return(.empty,false)
                    }
                }
                return (.empty,true)
            }
        }
    }
    
    private var winner: CircleStatus{
        
        
        
        var x = 0
        
        while (x<36){//horizontal
            for i in 0...3{
                if (x + 3 < 42 && x+2 < 42 && x + 1 < 42){
                    if let check = self.checkCircle([i+x,i+x+1,i+x+2,i+x+3]){
                        return check
                    }
                }
                x += 7
            }
        }
        x = 0
        while (x < 7 ){//vertical
            for i in 0...2{
                if (x+(i*7)+7 < 42 && (i*7)+x+14 < 42 && (i*7)+x+21 < 42){
                    if let check = self.checkCircle([x+(i*7),(i*7)+x+7,(i*7)+x+14,(i*7)+x+21]){
                        return check
                    }
                    
                }
                x += 1
            }
        }
        x = 3//nyamping kanan ke kiri
        var z : Int = 1
        var m = 1
        while (z<5){
            if (z >= 3 ){m = 2 }
            if m == 1{
                if let check = self.checkCircle([x+(0*6),(0*6)+x+6,(0*6)+x+12,(0*6)+x+18]){
                    return check
                }
            }
            else {
                for i in 0...m {
                    if m == 2 && z == 2 && ((i*6)+x+18)<=28{
                        if let check = self.checkCircle([x+(i*6),(i*6)+x+6,(i*6)+x+12,(i*6)+x+18]){
                            return check
                        }
                    }
                    else if z != 2{
                        if (x+(i*6) < 42 && (i * 6 ) + x + 6 < 42 && (i*6)+x+12 < 42 && (i*6) + x + 18 < 42){
                            if let check = self.checkCircle([x+(i*6),(i*6)+x+6,(i*6)+x+12,(i*6)+x+18]){
                                return check
                            }
                        }
                    }
                }
            }
            z += 1
            x += 1
        }
        if let check = self.checkCircle([13,19,25,31]){
            return check
        }
        else if let check = self.checkCircle([19,25,31,37]){
            return check
        }
        else if let check = self.checkCircle([20,26,32,38]){
            return check
        }
        else if let check = self.checkCircle([7,14,21,28]){
            return check
        }else if let check = self.checkCircle([0,7,14,21]){
            return check
        }else if let check = self.checkCircle([1,8,15,22]){
            return check
        }else if let check = self.checkCircle([8,15,22,29]){
            return check
        }else if let check = self.checkCircle([2,9,16,23]){
            return check
        }else if let check = self.checkCircle([9,16,23,30]){
            return check
        }else if let check = self.checkCircle([3,10,17,24]){
            return check
        }else if let check = self.checkCircle([10,17,24,31]){
            return check
        }else if let check = self.checkCircle([4,11,18,25]){
            return check
        }else if let check = self.checkCircle([11,18,25,32]){
            return check
        }else if let check = self.checkCircle([5,12,19,26]){
            return check
        }else if let check = self.checkCircle([12,19,26,33]){
            return check
        }else if let check = self.checkCircle([6,13,20,27]){
            return check
            
        }else if let check = self.checkCircle([20,26,32,38]){
            return check
        }
        else if let check = self.checkCircle([13,20,27,34]){
            return check
        }
        else if let check = self.checkCircle([14,21,28,35]){
            return check
        }
        else if let check = self.checkCircle([15,22,29,36]){
            return check
        }
        else if let check = self.checkCircle([16,23,30,37]){
            return check
        }
        else if let check = self.checkCircle([17,24,31,38]){
            return check
        }
        else if let check = self.checkCircle([18,25,32,39]){
            return check
        }
        else if let check = self.checkCircle([19,26,33,40]){
            return check
        }
        else if let check = self.checkCircle([20,27,34,41]){
            return check
        }
        else if let check = self.checkCircle([14,15,16,17]){
            return check
        }
        else if let check = self.checkCircle([15,16,17,18]){
            return check
        }
        else if let check = self.checkCircle([16,17,18,19]){
            return check
        }
        else if let check = self.checkCircle([17,18,19,20]){
            return check
        }
        else if let check = self.checkCircle([21,22,23,24]){
            return check
        }
        else if let check = self.checkCircle([22,23,24,25]){
            return check
        }
        else if let check = self.checkCircle([23,24,25,26]){
            return check
        }
        else if let check = self.checkCircle([24,25,26,27]){
            return check
        }
        else if let check = self.checkCircle([28,29,30,31]){
            return check
        }
        else if let check = self.checkCircle([29,30,31,32]){
            return check
        } else if let check = self.checkCircle([30,31,32,33]){
            return check
        }
        else if let check = self.checkCircle([31,32,33,34]){
            return check
        }
        else if let check = self.checkCircle([35,36,37,38]){
            return check
        }
        else if let check = self.checkCircle([36,37,38,39]){
            return check
        }
        else if let check = self.checkCircle([37,38,39,40]){
            return check
        }
        else if let check = self.checkCircle([38,39,40,41]){
            return check
        }
        
        x = 3
        var z2 : Int = 1
        var m2 = 1
        while (z2<5 && x>=0){
            if (z2 >= 3 ){m2 = 2 }
            if m2 == 1{
                if let check = self.checkCircle([x+(0*8),(0*8)+x+8,(0*8)+x+16,(0*6)+x+24]){
                    return check
                }
            }
            else {
                for i in 0...m2 {
                    if m2 == 2 && z2 == 2 && ((i*8)+x+24)<=34{
                        if let check = self.checkCircle([x+(i*8),(i*8)+x+8,(i*8)+x+16,(i*6)+x+24]){
                            return check
                        }
                    }
                    else if z2 != 2{
                        if (x+(i*8) < 42 && (i * 8 ) + x + 8 < 42 && (i*8)+x+16 < 42 && (i*8) + x + 24 < 42){
                            if let check = self.checkCircle([x+(i*8),(i*8)+x+8,(i*8)+x+16,(i*8)+x+24]){
                                return check
                            }
                        }
                    }
                }
            }
            z2 += 1
            x += 1
        }
        if let check = self.checkCircle([7,15,23,31]){
            return check
        }
        else if let check = self.checkCircle([15,23,31,39]){
            return check
        }
        else if let check = self.checkCircle([14,22,30,38]){
            return check
        }
        
        
        return .empty
    }
    private func checkCircle(_ indexex :[Int])->CircleStatus?{// dari koordinat jatuhnya
        var winRed: Int = 0
        var winBlue: Int = 0
        for index in indexex {
            let circle = circles[index]
            if circle.circleStatus == .player1{
                winRed += 1
            }
            else if circle.circleStatus == .player2{
                winBlue += 1
            }
            
        }
        if winRed == 4 {
            return .player1
        }
        else if winBlue == 4 {
            return .player2
        }
        
        return nil
    }
    
    func makeMove(index: Int, player:CircleStatus,play: Int ){
        if ((circles[index].self.circleStatus == .empty  ) && play % 2 == 0 ){
            circles[index].circleStatus = .player1}
        else if ((circles[index].self.circleStatus == .empty  ) && play % 2 == 1 ){
            circles[index].circleStatus = .player2
            
            
        }
        
        
        
    }
}



struct CircleView: View{
    @ObservedObject var dataSource : Circless
    var action: () -> Void
    var body: some View {
        
        
        Button(action: {
            self.action()
        },
        
        label: {
            if (self.dataSource.circleStatus == .empty){
                Circle()
                    .frame(width: 35, height: 30)
                    .foregroundColor(.white)
                    .overlay(Circle().stroke(Color.black, lineWidth: 5))
                //.strokeBorder(Color.black, lineWidth: 5)
                
            }
            else if (self.dataSource.circleStatus == .player1){
                if (self.dataSource.conect == .yes) {
                    Image("b.smile")
                        .resizable()
                        .frame(width: 35, height: 30)
                    .clipShape(Circle())
                }
                else {
                Image("b.sad")
                    .resizable()
                    .frame(width: 35, height: 30)
                .clipShape(Circle())
                
                }
            }
            else if (self.dataSource.circleStatus == .player2){
                if (self.dataSource.conect == .yes) {
                    Image("w.smile")
                        .resizable()
                        .frame(width: 35, height: 30)
                    .clipShape(Circle())
                }
                else {
                Image("w.sad")
                    .resizable()
                    .frame(width: 35, height: 30)
                .clipShape(Circle())
                
                }
            }
            //Text(self.dataSource.circleStatus == .player1 ? "Red":self.dataSource.circleStatus == .player2 ? "Blue": " " ) // ini bisa di ganti jadi warna
        }
        )}
}

struct ContentView: View {
    @StateObject var Board = Boardmodel()
    @State var turn = 0
    @State var gameOver : Bool = false
    @State var Black = 0
    @State var White = 0
    
    
    func buttonAction ( index : Int){
        
        if (Board.circles[41 - (6 - (( index ) % 7))].self.circleStatus == .empty)
        {
            _ = self.Board.makeMove(index: 41 - (6 - (( index ) % 7)), player: .empty, play: turn)
        }
        else if (Board.circles[41 - (6 - (( index ) % 7))].self.circleStatus != .empty){
            var x = 41 - (6 - (( index ) % 7))
            while ( Board.circles[x].self.circleStatus != .empty ){
                x -= 7
                
                if (x < 0){
                    x += 7
                    break
                }
            }
            if (x + 8 < 42 && x-8 >= 0){
            if( Board.circles[x].self.circleStatus ==  Board.circles[x+1].self.circleStatus){
                Board.circles[x].self.conect = .yes
                Board.circles[x+1].self.conect = .yes
                        
                 }
            if( Board.circles[x].self.circleStatus ==  Board.circles[x-1].self.circleStatus){
                Board.circles[x].self.conect = .yes
                Board.circles[x-1].self.conect = .yes
                        
                 }
            if( Board.circles[x].self.circleStatus ==  Board.circles[x-7].self.circleStatus){
                Board.circles[x].self.conect = .yes
                Board.circles[x-7].self.conect = .yes
                 }
            if( Board.circles[x].self.circleStatus ==  Board.circles[x+7].self.circleStatus){
                Board.circles[x].self.conect = .yes
                Board.circles[x+7].self.conect = .yes
                 }
            if( Board.circles[x].self.circleStatus ==  Board.circles[x+8].self.circleStatus){
                Board.circles[x].self.conect = .yes
                Board.circles[x+8].self.conect = .yes
                 }
            if( Board.circles[x].self.circleStatus ==  Board.circles[x-8].self.circleStatus){
                Board.circles[x].self.conect = .yes
                Board.circles[x-8].self.conect = .yes
                 }
            if( Board.circles[x].self.circleStatus ==  Board.circles[x-6].self.circleStatus){
                Board.circles[x].self.conect = .yes
                Board.circles[x-6].self.conect = .yes
                 }
            if( Board.circles[x].self.circleStatus ==  Board.circles[x+6].self.circleStatus){
                Board.circles[x].self.conect = .yes
                Board.circles[x-6].self.conect = .yes
                 }
            }
            _ = self.Board.makeMove(index: x, player: .empty, play: turn)
        }
        
        
        self.gameOver = self.Board.gameOver.1
        turn += 1
    }
    
    
    var body: some View {
        
        
        VStack{
            HStack{
                Image("connect2")
                    .resizable()
                    .scaledToFit()
                    .frame (width: 200, height: 150)
            }
            HStack{
                Image("icon")
                    .resizable()
                    .frame (width: 50, height: 50)
                
                Text("Connect")
                    .font(.system(size: 30))
                    .bold()
                    .font(.largeTitle)
                    .frame(width: 120, height: 60)
                    .foregroundColor(.black)
                
            }
      
        }
        ZStack{
           
            
            HStack{
            
            Rectangle()
                .foregroundColor(.white)
                .frame(width:150, height:80 )
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .strokeBorder(Color.black, lineWidth: 15))
                Spacer().frame(width:50)

            Rectangle()
                .foregroundColor(.white)
                .frame(width:150, height:80 )
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .strokeBorder(Color.black, lineWidth: 15))
        }
            ZStack{
               
            
            HStack{
                
                
                Image("w.smile")
                .resizable()
                .frame(width: 35, height: 30)
                .overlay(Circle()
                            .stroke(Color.black, lineWidth: 4))
               
                Spacer().frame(width:100)
                 Image("b.smile")
                .resizable()
                .frame(width: 35, height: 30)
                .overlay(Circle()
                            .stroke(Color.black, lineWidth: 4))
              
                
                
                
                            }
                
          
            
            Spacer().frame(width:50)
            Spacer().frame(width:50)
            
        }
        ZStack{
            VStack{
                
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width:350, height:280 )
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.black, lineWidth: 15))
                Spacer().frame(height:140)
            }
            VStack{
                
               
                ForEach(0 ..< Board.circles.count/7, content:{
                    row in
                    HStack{
                        ForEach(0 ..< 7,content:{
                            column in
                            let index = row * 7 + column
                            CircleView(dataSource: Board.circles[index], action: {self.buttonAction(index:index)})
                            //,action: self.buttonAction(index: index)
                            
                        })
                    }
                })
                
                Spacer().frame(height:20)
                Spacer().frame(height:40)
                ZStack{
                
               
           
                HStack{
                   
                   
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width:300, height:80 )
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .strokeBorder(Color.black, lineWidth: 15))
                    
                    
                }
                    if (turn%2 == 0 ){
                    Image("b.smile")
                       .resizable()
                       .frame(width: 45, height: 45)
                       .overlay(Circle()
                                   .stroke(Color.black, lineWidth: 4))
                    }
                    else {
                        Image("w.smile")
                           .resizable()
                           .frame(width: 45, height: 45)
                           .overlay(Circle()
                                       .stroke(Color.black, lineWidth: 5))
                        
                    }
                    }
            }
            .alert(isPresented: self.$gameOver, content: {
                Alert(title: Text("Game Over"),
                      message: Text(self.Board.gameOver.0 != .empty ? self.Board.gameOver.0 == .player1 ? "Black Win!": "White Wins!" : "Nobody Wins" ) , dismissButton: Alert.Button.destructive(Text("Ok"), action: {
                        self.Board.resetGame()
                      }))
            })
            
           
            
            if (self.Board.gameOver.0 == .player1  ){
                HStack{
                
                Image("b.win")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .overlay(Circle()
                                .stroke(Color.black, lineWidth: 4))
                    Image("w.lose")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .overlay(Circle()
                                    .stroke(Color.black, lineWidth: 4))
                }
               }
            else  if (self.Board.gameOver.0 == .player2  ){
                HStack{
                
                Image("b.lose")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .overlay(Circle()
                                .stroke(Color.black, lineWidth: 4))
                    Image("w.win")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .overlay(Circle()
                                    .stroke(Color.black, lineWidth: 4))
                }
    }
           
               }
            
            ///
        }
    
    }
    
    
    
    
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

