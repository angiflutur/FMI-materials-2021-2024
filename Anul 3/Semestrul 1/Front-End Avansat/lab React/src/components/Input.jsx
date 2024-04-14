import { useTheme } from "../store/Theme.context";

const Input = () => {
  const { theme } = useTheme();

  return (
    <input
      type="text"
      style={{
        backgroundColor: theme === "light" ? "black" : "white",
        color: theme === "light" ? "white" : "black",
      }}
    />
  );
};

export default Input;
