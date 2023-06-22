# Package
export CHANNEL_NAME= pharmanet
export CC_NAME=pharmanetChaincode
export CC_SRC_PATH=../chaincode
export CC_RUNTIME_LANGUAGE=node
export CC_VERSION=5.0
export CC_SEQUENCE=5
export FABRIC_CFG_PATH=$PWD/../config/
peer lifecycle chaincode package ${CC_NAME}.tar.gz --path ${CC_SRC_PATH} --lang ${CC_RUNTIME_LANGUAGE} --label ${CC_NAME}_${CC_VERSION}

# Install
# On Peer0 of Manufacturer
export ORDERER_CA=${PWD}/organizations/ordererOrganizations/pharma-network.com/orderers/orderer.pharma-network.com/msp/tlscacerts/tlsca.pharma-network.com-cert.pem
export CORE_PEER_LOCALMSPID="manufacturerMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/manufacturer.pharma-network.com/peers/peer0.manufacturer.pharma-network.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/manufacturer.pharma-network.com/users/Admin@manufacturer.pharma-network.com/msp
export CORE_PEER_ADDRESS=localhost:7051
peer lifecycle chaincode install ${CC_NAME}.tar.gz
# On Peer1 of Manufacturer
export CORE_PEER_ADDRESS=localhost:8051
peer lifecycle chaincode install ${CC_NAME}.tar.gz

# On Peer0 of Distributor
export CORE_PEER_LOCALMSPID="distributorMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/distributor.pharma-network.com/peers/peer0.distributor.pharma-network.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/distributor.pharma-network.com/users/Admin@distributor.pharma-network.com/msp
export CORE_PEER_ADDRESS=localhost:9051
peer lifecycle chaincode install ${CC_NAME}.tar.gz
# On Peer1 of Distributor
export CORE_PEER_ADDRESS=localhost:10051
peer lifecycle chaincode install ${CC_NAME}.tar.gz

# On Peer0 of Retailer
export CORE_PEER_LOCALMSPID="retailerMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/retailer.pharma-network.com/peers/peer0.retailer.pharma-network.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/retailer.pharma-network.com/users/Admin@retailer.pharma-network.com/msp
export CORE_PEER_ADDRESS=localhost:11051
peer lifecycle chaincode install ${CC_NAME}.tar.gz
# On Peer1 of Retailer
export CORE_PEER_ADDRESS=localhost:12051
peer lifecycle chaincode install ${CC_NAME}.tar.gz
# On Peer0 of consumer
export CORE_PEER_LOCALMSPID="consumerMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/consumer.pharma-network.com/peers/peer0.consumer.pharma-network.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/consumer.pharma-network.com/users/Admin@consumer.pharma-network.com/msp
export CORE_PEER_ADDRESS=localhost:13051
peer lifecycle chaincode install ${CC_NAME}.tar.gz
# On Peer1 of consumer
export CORE_PEER_ADDRESS=localhost:14051
peer lifecycle chaincode install ${CC_NAME}.tar.gz

# On Peer0 of Transporter
export CORE_PEER_LOCALMSPID="transporterMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/transporter.pharma-network.com/peers/peer0.transporter.pharma-network.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/transporter.pharma-network.com/users/Admin@transporter.pharma-network.com/msp
export CORE_PEER_ADDRESS=localhost:15051
peer lifecycle chaincode install ${CC_NAME}.tar.gz
# On Peer1 of Transporter
export CORE_PEER_ADDRESS=localhost:16051
peer lifecycle chaincode install ${CC_NAME}.tar.gz
peer lifecycle chaincode queryinstalled