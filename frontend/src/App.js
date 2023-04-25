import React from 'react';
import { ApolloProvider } from '@apollo/client';
import client from './client';
import ProductList from './components/ProductList';
import AddProductForm from './components/AddProductForm';

function App() {
  return (
    <ApolloProvider client={client}>
      <div>
        <ProductList />
        {/* <AddProductForm /> */}
      </div>
    </ApolloProvider>
  );
}

export default App;