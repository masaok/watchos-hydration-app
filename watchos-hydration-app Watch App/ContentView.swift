//
//  ContentView.swift
//  watchos-hydration-app Watch App

import SwiftUI

struct ContentView: View {
    @State private var waterIntake: Double = 0
    let dailyGoal: Double = 2000 // in ml, e.g., 2 liters
    
    var clampedWaterIntake: Double {
        return min(max(waterIntake, 0), dailyGoal)
    }
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Hydration Reminder")
                .font(.headline)
            
            Text("\(Int(clampedWaterIntake))ml / \(Int(dailyGoal))ml")
                .font(.title)
            
            ProgressView(value: clampedWaterIntake, total: dailyGoal)
            
            HStack {
                Button(action: {
                    waterIntake += 250
                }) {
                    Text("+250ml (Glass)")
                }
                
                Button(action: {
                    waterIntake += 500
                }) {
                    Text("+500ml (Bottle)")
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
