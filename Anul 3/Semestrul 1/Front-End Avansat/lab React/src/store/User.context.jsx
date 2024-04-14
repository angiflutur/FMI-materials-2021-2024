import { createContext, useEffect, useState } from "react";

export const UserContext = createContext({
  isAuthenticated: true,
});

export const UserProvider = ({ children }) => {
  const [isAuthenticated, setIsAuthenticated] = useState(false);

  useEffect(() => {
    if (localStorage.getItem("authToken")) {
      setIsAuthenticated(true);
    }
  }, []);

  return (
    <UserContext.Provider
      value={{
        isAuthenticated: isAuthenticated,
      }}
    >
      {children}
    </UserContext.Provider>
  );
};
