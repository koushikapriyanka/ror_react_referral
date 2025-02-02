import React, { useState, useEffect } from "react";
import { TextField, Button, Container, Typography } from "@mui/material";
import { useNavigate } from "react-router-dom";
import axiosInstance from "./utils/api";
import { getAuthTokens, clearAuthTokens } from "./utils/auth";

function Referral() {
  const [email, setEmail] = useState("");
  const [message, setMessage] = useState("");
  const [error, setError] = useState("");
  const navigate = useNavigate();

  useEffect(() => {
    const { accessToken, client, uid } = getAuthTokens();
    if (!accessToken || !client || !uid) {
      navigate("/login");
    }
  }, [navigate]);

  const handleSubmit = async (e) => {
    e.preventDefault();

    try {
      const response = await axiosInstance.post("/send_referral", { email });
      setMessage(response.data.message);
      setEmail("");
    } catch (err) {
      setError(err.response?.data?.message || "Failed to send referral.");
    }
  };

  const handleLogout = () => {
    clearAuthTokens();
    navigate("/login");
  };

  return (
    <Container>
      <Typography variant="h4">Send Referral</Typography>
      
      <form onSubmit={handleSubmit}>
        <TextField
          label="Recipient's Email"
          variant="outlined"
          fullWidth
          margin="normal"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
        />
        <Button type="submit" variant="contained" color="primary">
          Send Invitation
        </Button>
      </form>

      {message && <Typography color="success">{message}</Typography>}
      {error && <Typography color="error">{error}</Typography>}

      <Button 
        variant="contained" 
        color="secondary" 
        onClick={handleLogout}
        style={{ marginTop: "20px" }}
      >
        Logout
      </Button>
    </Container>
  );
}

export default Referral;
