import {
  Button,
  Center,
  FormControl,
  FormLabel,
  Heading,
  Input,
  Text,
} from "@chakra-ui/react";
import React, { useState } from "react";
import { useSelector } from "react-redux";
import { Navigate, useNavigate } from "react-router-dom";
import { createUserWithEmailAndPassword } from "firebase/auth";
import { auth } from "../lib/firebase";

const RegisterPage = () => {
  const navigate = useNavigate();

  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");

  const isAuthenticated = useSelector((state) => state.auth.isAuthenticated);

  if (isAuthenticated) {
    return <Navigate to="/" />;
  }

  const onRegister = async () => {
    try {
      const userCredential = await createUserWithEmailAndPassword(
        auth,
        email,
        password
      );
      navigate("/login");
    } catch (error) {
      console.error(error.message);
      setError(error.message);
    }
  };

  return (
    <Center flexDirection="column" height="100vh">
      <Center
        flexDirection="column"
        p="20"
        bg="blue.100"
        boxShadow="2"
        borderRadius="lg"
      >
        <Heading>Register</Heading>
        <FormControl>
          <FormLabel>Email</FormLabel>
          <Input
            value={email}
            onChange={(event) => {
              setEmail(event.target.value);
              setError("");
            }}
            bg="white"
            type="email"
          />
        </FormControl>

        <FormControl mt="5">
          <FormLabel>Password</FormLabel>
          <Input
            value={password}
            onChange={(event) => {
              setPassword(event.target.value);
              setError("");
            }}
            bg="white"
            type="password"
          />
        </FormControl>

        {error && <Text color="red">{error}</Text>}

        <Text
          color="blue"
          onClick={() => {
            navigate("/login");
          }}
        >
          Do you have an account?
        </Text>

        <Button mt="5" onClick={onRegister}>
          Register
        </Button>
      </Center>
    </Center>
  );
};

export default RegisterPage;
