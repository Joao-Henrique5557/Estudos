import React from "react";
import { View, Text, Button } from "react-native";

function HomeScreen({ navigation }) {
  return (
    <View style={{ flex: 1, justifyContent: "center", alignItems: "center" }}>
      <Text>Home Screen</Text>
      <Button
        title="Go to Details"
        onPress={() =>
          navigation.navigate("Details", {
            itemId: 42,
            otherParam: "Hello World",
          })
        }
      />
    </View>
  );
}
export default HomeScreen;
