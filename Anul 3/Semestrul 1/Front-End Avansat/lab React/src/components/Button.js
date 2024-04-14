import { useEffect } from "react";
import { useTheme } from "../store/Theme.context";
import styles from "./Button.module.css";

const Button = (props) => {
  const { theme } = useTheme();

  useEffect(() => {
    console.log("Button mounted!");

    return () => {
      console.log("Button unmounted!");
    };
  }, []);

  return (
    <div
      className={styles.container}
      style={{
        backgroundColor: theme === "light" ? "black" : "white",
        color: theme === "light" ? "white" : "black",
      }}
      onClick={props.onClick}
    >
      {props.title}
    </div>
  );
};

export default Button;
