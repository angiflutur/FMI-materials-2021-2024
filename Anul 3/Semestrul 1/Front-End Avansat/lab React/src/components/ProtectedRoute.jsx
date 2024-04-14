import React from "react";
import { Navigate, Outlet } from "react-router-dom";
import { useSelector } from "react-redux";

const ProtectedRoute = (props) => {
  const isAuthenticated = useSelector((state) => state.auth.isAuthenticated);

  const isAllowed = isAuthenticated;

  if (!isAllowed) {
    return <Navigate to={props.redirectTo} replace />;
  }

  return <Outlet />;
};

export default ProtectedRoute;
