# SDR Outdoor para iOS e iPadOS

O aplicativo SwiftUI está em `SDROutdoorApp/`; o projeto pronto para abrir no Xcode é `SDROutdoorApp.xcodeproj`. O esquema mantém o nome técnico `SDROutdoorApp`, enquanto o nome mostrado no aparelho é **SDR Outdoor**.

O XCFramework em `Frameworks/` contém o núcleo Rust para arm64 de dispositivos físicos e para o simulador Apple Silicon. Para gerar novamente as bibliotecas, execute `./apple/build-rust.sh` na raiz do repositório. Para regenerar o projeto Xcode, instale XcodeGen e execute `./apple/generate-xcodeproj.sh`.

O receptor usa IQ pela rede via servidor SDR++. A conexão é configurada em **Settings → Servidor SDR++**. O acesso direto a dispositivos USB SDR não faz parte deste alvo iOS/iPadOS.
