import React from "react";
import { View, Text } from "react-native";

function DetailsScreen({ route, navigation }) {
  // Desestrutura os parâmetros recebidos da rota
  const { itemId, otherParam } = route.params;

  return (
    <View style={{ flex: 1, justifyContent: "center", alignItems: "center" }}>
      <Text>Details Screen</Text>
      <Text>Item ID: {itemId}</Text>
      <Text>Other Param: {otherParam}</Text>
    </View>
  );
}
export default DetailsScreen;
