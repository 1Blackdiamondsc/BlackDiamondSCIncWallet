# BlackDiamondSCIncWallet
BDSCI, BDSCI1 &amp; MTGH Swap Wallet Built On The Avalanche &amp; Polygon Matic Network.

Installation
React.js
web3 react wallet is available on npm. To install it, type:

$ npm install web3-react-wallet
Usage
Import the library in your code, and then follow these code snippets:

// App.js
import { providers, Web3ReactProvider } from 'web3-react-wallet';

const App = () => {
  const { getLibrary } = providers();

  return (
    <Web3ReactProvider getLibrary={getLibrary}>
      <Home />
    </Web3ReactProvider>
  );
};
// Home.js
import { ConnectorNames, useAuth } from 'web3-react-wallet';

function Home() {
  const { login, useWeb3React } = useAuth();
  const { account } = useWeb3React();

  const conf = {
    chainId: 1,
    infuraId: "abcd1234wxyz6789",
    websiteName: "Wonderful Swap",
    websiteDescription: "Low slippage and high liquidity",
    websiteIconURL: "https://i.ibb.co/QMLVML7/web3-react-wallet.png",
    websiteURL: "https://example.org"
  }

  return(
    <div>
      Website Logo
      <button onClick={() => {
        login(ConnectorNames.Injected, conf);
      }}>Connect MetaMask</button>
    </div>
  )
}
Supported wallets and chains
MetaMask and WalletConnect
Ethereum Mainnet and Ethereum Tesnet Rinkeby
Support for more chains is coming soon. To learn more please head over to example folder.

Keywords
web3contextfrontenddappmetamaskwalletconnectreactreact-hookshooksnextjsethereumjavascripttypescriptwalletlinkwalletmd

