import { ApolloClient, InMemoryCache } from '@apollo/client';
const token = 'YOUR_AUTH_TOKEN';
const client = new ApolloClient({
  uri: 'http://localhost:4000/graphql',
  headers: {
    Authorization: `Bearer ${token}`,
  },
  cache: new InMemoryCache(),
});

console.log("TRUEEEEEEEEEEEEEEEEEEEEEE",client)
export default client;