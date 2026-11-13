# SDR Outdoor

Desenvolvedor: **Alberto V M**.

Aplicativo nativo para iPhone e iPad que recebe IQ pela rede de um servidor SDR++, mostra espectro e waterfall, reproduz áudio e oferece sintonia, filtros, modos NFM/WFM/AM/USB/LSB/CW e funções de rastreio de satélites.

## Estrutura

- `apple/`: interface SwiftUI, projeto Xcode, ícones e XCFramework do núcleo.
- `core/`: núcleo Rust, DSP, fontes de IQ e ponte para iOS/iPadOS.
- `plugins/`: decodificadores Luau incluídos no núcleo.

## Abrir e compilar

1. Abra `apple/SDROutdoorApp.xcodeproj` no Xcode.
2. Escolha o esquema `SDROutdoorApp` e um iPhone ou iPad com iOS/iPadOS 18 ou superior.
3. Para aparelho físico, configure sua equipe de assinatura no alvo do aplicativo.
4. Compile e execute. O XCFramework incluído contém bibliotecas para Apple Silicon Simulator e dispositivos arm64.

Para reconstruir o núcleo a partir do código Rust, instale os alvos `aarch64-apple-ios` e `aarch64-apple-ios-sim` e execute `./apple/build-rust.sh`. O projeto Xcode também pode ser regenerado a partir de `apple/project.yml` com `./apple/generate-xcodeproj.sh` (requer XcodeGen).

## Conectar ao SDR++

Inicie o módulo de servidor do SDR++ em um computador com SDR e, em **Settings → Servidor SDR++**, informe o IP acessível pelo iPhone/iPad e a porta TCP do servidor (normalmente 5259). O simulador pode usar `127.0.0.1` quando servidor e simulador rodam no mesmo Mac. Em um aparelho físico, use o IP do computador na rede local.

Na tela **Receiver**, toque em **Alterar** para digitar a frequência em hertz. Os pontos são inseridos automaticamente. A nova sintonia é aplicada quando você toca em **Sintonizar**. Também é possível sintonizar tocando no espectro ou waterfall.

## Origem e licença

O código tem origem em trabalhos anteriores de Zoltan Doczi e na adaptação iOS/iPadOS mantida por Alberto V M. Os créditos e links históricos estão em [ATTRIBUTION.md](ATTRIBUTION.md). O código permanece sob GPL-3.0-or-later; veja [LICENSE](LICENSE). A dependência vendorizada `core/third_party/rtl-sdr-rs` mantém sua licença própria no respectivo diretório.
