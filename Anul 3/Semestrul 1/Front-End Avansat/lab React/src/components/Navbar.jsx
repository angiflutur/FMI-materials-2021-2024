import { Link, Outlet, useMatch } from "react-router-dom";
import { Box, HStack, Text } from "@chakra-ui/react";
import { CloseIcon } from "@chakra-ui/icons";
import { signOut } from "firebase/auth";
import { auth } from "../lib/firebase";

const Navbar = () => {
  const homeMatch = useMatch("/");
  const counterMatch = useMatch("/counter");

  return (
    <>
      <HStack bg="red.200" p="3" spacing="10">
        <Box p="3">
          <Link to="/">
            <Text
              color={homeMatch ? "green.400" : "black"}
              fontWeight="bold"
              fontSize="24"
            >
              Home
            </Text>
          </Link>
        </Box>

        <Box>
          <Link to="/counter">
            <Text
              color={counterMatch ? "green.400" : "black"}
              fontWeight="bold"
              fontSize="24"
            >
              Counter
            </Text>
          </Link>
        </Box>

        <CloseIcon
          ml="auto"
          mr="5"
          w={6}
          h={6}
          _hover={{
            cursor: "pointer",
          }}
          onClick={() => {
            signOut(auth);
          }}
        />
      </HStack>

      <Outlet />
    </>
  );
};

export default Navbar;
