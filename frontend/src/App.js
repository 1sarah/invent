import React from 'react';
import { ApolloProvider } from '@apollo/client';

import Products from './components/products';
import {  BrowserRouter as Router, Switch, Route, Link, Routes } from "react-router-dom";
import Dashboard from './dashboard/dashboard';

function App() {
  return (
      
      <>
        <nav className="sidebar">
          <ul>
            <li><Link to="/">Dashboard</Link></li>
            <li><Link to="/products">Products</Link></li>
          </ul>
        </nav>
        <div className="main-content">
     
          <Routes>
            <Route exact path="/" element={<Dashboard/>} />
            <Route path="/products" element={Products} />
           </Routes>
       
        </div>
        </>
  
   

  );
}

export default App;