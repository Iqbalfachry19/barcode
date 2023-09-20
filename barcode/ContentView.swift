//
//  ContentView.swift
//  barcode
//
//  Created by Iqbal Fachry on 29/07/23.
//

import SwiftUI
import CodeScanner
struct ContentView: View {
    @State var isPresentingScanner = false
    @State var scannedCode: String = "Scan a QR code to get started."
    var scannerSheet : some View{
        CodeScannerView(
            codeTypes: [.qr],
            completion: {result in
                if case let .success(code) = result{
                    self.scannedCode = code.string
                    self.isPresentingScanner = false
                }
            }
        )
    }
    var body: some View {
        VStack(spacing: 10) {
           Text(scannedCode)
            Image("qr") // Ganti "your_qr_code_logo" dengan nama gambar logo Anda
                       .resizable()
                       .frame(width: 100, height: 100) // Sesuaikan ukuran gambar logo
                       .rotation3DEffect(.degrees(isPresentingScanner ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                 
            Button("Scan QR Code"){
                self.isPresentingScanner = true
            }.sheet(isPresented: $isPresentingScanner){
                self.scannerSheet
            }
        }
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
