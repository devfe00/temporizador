import SwiftUI

struct ContentView: View {
    @State private var timeRemaining = 60 
    @State private var timerRunning = false
    @State private var timer: Timer?
    
    var body: some View {
        VStack(spacing: 30) {

            Text("Temporizador")
                .font(.title)
                .fontWeight(.bold)
            

            Text(formatTime(timeRemaining))
                .font(.system(size: 60, weight: .bold))
                .foregroundColor(timeRemaining < 10 ? .red : .primary)
                .padding()
            

            HStack(spacing: 30) {

                Button(action: resetTimer) {
                    Text("Reset")
                        .font(.title2)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
                
   
                Button(action: timerRunning ? pauseTimer : startTimer) {
                    Text(timerRunning ? "Pausar" : "Iniciar")
                        .font(.title2)
                        .padding()
                        .background(Color.blue.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            

            HStack(spacing: 20) {
                Button(action: { addTime(-10) }) {
                    Text("-10s")
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                }
                
                Button(action: { addTime(-60) }) {
                    Text("-1m")
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                }
                
                Button(action: { addTime(60) }) {
                    Text("+1m")
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                }
                
                Button(action: { addTime(10) }) {
                    Text("+10s")
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                }
            }
        }
        .padding()
    }
    
 
    func formatTime(_ totalSeconds: Int) -> String {
        let minutes = totalSeconds / 60
        let seconds = totalSeconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
 
    func addTime(_ seconds: Int) {
        let newTime = timeRemaining + seconds
        if newTime >= 0 {
            timeRemaining = newTime
        }
    }
    

    func startTimer() {
        timerRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                timer?.invalidate()
                timerRunning = false
            }
        }
    }
    

    func pauseTimer() {
        timer?.invalidate()
        timerRunning = false
    }
    

    func resetTimer() {
        timer?.invalidate()
        timerRunning = false
        timeRemaining = 60
    }
}

#Preview {
    ContentView()
}
